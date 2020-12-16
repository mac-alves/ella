import 'package:ella/app/modules/money/interfaces/local_storage.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:ella/app/shared/utils/enum_states.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'read_controller.g.dart';

@Injectable()
class ReadController = _ReadControllerBase with _$ReadController;

abstract class _ReadControllerBase with Store {
  
  final ILocalStorage _storage = Modular.get();

  final MoneyController money;

  _ReadControllerBase(this.money) {
    _setExpenses();
  }

  _setExpenses() async {
    var localFixedExpenses = await _storage.getAllFixedExpenses();
    var localExpectedExpenses = await _storage.getAllExpectedExpenses();

    if (localFixedExpenses == null) {
      money.fixedExpenses = <SpentStore>[].asObservable();
    } else {
      money.fixedExpenses = localFixedExpenses.asObservable();
    }

    if (localExpectedExpenses == null) {
      money.expectedExpenses = <SpentStore>[].asObservable();
    } else {
      money.expectedExpenses = localExpectedExpenses.asObservable();
    }

    setCurrentState(States.SUCESS);
  }

  @observable
  States currentState = States.LOADING;

  @observable
  ObservableList<SpentStore> spents = <SpentStore>[].asObservable();

  @observable
  String title;

  @observable
  bool isDelete = false;

  @observable
  ObservableList<String> listSpentToDelete = <String>[].asObservable();

  @action
  void setCurrentState(States value) => currentState = value;

  @action
  void setIsDelete(bool value) => isDelete = value;

  @action
  void setTitle(String type) {
    var titles = {
      TypeExpense.FIXED.index.toString(): 'Gastos Fixos',
      TypeExpense.EXPECTED.index.toString(): 'Gastos Previstos',
      TypeExpense.VARIED.index.toString(): 'Gastos Variados',
      'FG': 'Gastos Fixos Gerais',
      'PG': 'Gastos Previstos Gerais',
    };

    title = titles[type];
  }

  @action
  void setSpents(
    int id, String type, bool isFixedGeneral, bool isExpectedGeneral) {

    if (isFixedGeneral) {
      spents = money.fixedExpenses;
      setTitle('FG');
      return;
    }

    if (isExpectedGeneral) {
      spents = money.expectedExpenses;
      setTitle('PG');
      return;
    }

    if (id == null || type == null) {
      return;
    }

    EstimateStore estimate = money.getEstimate(id);
    ExpenseStore expense = estimate.expenses
      .firstWhere(
        (expense) => expense.type == getTypeFromIndex(type),
        orElse: () => null
      );

    if(expense != null) {
      setTitle(getIndexFromType(expense.type));
      spents = expense.spents;
    }
  }

  @action
  void selectToDelete(String idSpent) {
    if (!listSpentToDelete.contains(idSpent)) {
      listSpentToDelete.add(idSpent);
      setIsDelete(true);
    }
  }

  @action
  void removeToDelete(String idSpent) {
    listSpentToDelete.remove(idSpent);

    if (listSpentToDelete.length == 0) {
      setIsDelete(false);
    }
  }

  /// 
  /// Deleta os gastos
  /// 
  deleteSpentSelecteds(
    int idEstimate, String type, bool isFixedGeneral, bool isExpectedGeneral){

    if (isFixedGeneral) {
      deleteFixedExpense();
    } else if (isExpectedGeneral) {
      deleteExpectedExpense();
    } else {
      deleteSpentToEstimate(idEstimate, type);
    }

    listSpentToDelete = <String>[].asObservable();
    setIsDelete(false);
    setSpents(idEstimate, type,  isFixedGeneral, isExpectedGeneral);
  }

  /// 
  /// Deleta os gastos fixos gerais
  /// 
  deleteFixedExpense(){
    // delete memory
    money.fixedExpenses = money.fixedExpenses
      .where((item) => !listSpentToDelete.contains(item.id))
      .toList().asObservable();

    // delete db
    _storage.deleteFixedExpense(listSpentToDelete.join(','));
  }

  /// 
  /// Deleta os gastos esperados gerais
  /// 
  deleteExpectedExpense(){
    // delete memory
    money.expectedExpenses = money.expectedExpenses
      .where((item) => !listSpentToDelete.contains(item.id))
      .toList().asObservable();

    // delete db
    _storage.deleteExpectedExpense(listSpentToDelete.join(','));
  }

  /// 
  /// Deleta os gastos de um orçamento vinculado
  /// 
  deleteSpentToEstimate(int idEstimate, String type){
    EstimateStore estimateEdited;

    money.estimates = money.estimates.map((estimate) {

      if (estimate.id == idEstimate){
        estimate.expenses = estimate.expenses.map((expense) {
          if (expense.type == getTypeFromIndex(type)){
            expense.spents = expense.spents
              .where((item) => !listSpentToDelete.contains(item.id))
              .toList().asObservable();

            if (expense.spents.length > 0) {
              expense.setLastValue(double.parse(expense.spents[0].value));
              expense.setValue(
                expense.spents.fold(0, (prev, item) => prev + double.parse(item.value))
              );
            } else {
              expense.setLastValue(double.parse('0.00'));
              expense.setValue(0.0);
            }
          }

          return expense;
        }).toList().asObservable();

        estimate.calculateFinalBalance(); 

        estimateEdited = EstimateStore().fromJson(estimate.toJson());
      }

      return estimate;
    }).toList().asObservable();

    // deleta o gasto  no banco
    _storage.putEstimate(estimateEdited.id, estimateEdited.toJson());
  }

  void goScreenEdit(
    BuildContext context, 
    String route,
    int id, String type, bool isFixedGeneral, bool isExpectedGeneral) async {

    var result = await Navigator.of(context).pushNamed(route);
    
    if (result != null) {
      setSpents(id, type, isFixedGeneral, isExpectedGeneral);
    }
  }
}
