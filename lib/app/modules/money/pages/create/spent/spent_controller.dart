import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:ella/app/shared/utils/list_of_months.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'spent_controller.g.dart';

@Injectable()
class SpentController = _SpentControllerBase with _$SpentController;

abstract class _SpentControllerBase with Store {
  
  final MoneyController money;

  @observable
  SpentStore newSpent;

  @observable
  String type;

  @observable
  String idEstimate;

  @observable
  bool errorType = false;

  @observable
  bool errorEstimate = false;

  @observable
  bool erroName = false;

  @observable
  bool erroValue = false;

  @observable
  bool errorDate = false;

  @observable
  bool enableDate = true;

  @observable
  bool enableValue = true;

  @observable
  bool enableIdEstimate = true;

  @observable
  bool isEdit = false;

  @observable
  bool isSpentExpected = false;

  @observable
  bool enableExpectedGeneral = false;

  @observable
  String msgErroName = 'Nome inválido';

  _SpentControllerBase(this.money);

  List<ItemSelect> types = [
    new ItemSelect(id: getIndexFromType(TypeExpense.FIXED), name: 'Fixo'),
    new ItemSelect(id: getIndexFromType(TypeExpense.EXPECTED), name: 'Previsto'),
    new ItemSelect(id: getIndexFromType(TypeExpense.VARIED), name: 'Variado'),
  ];

  @action
  void setNewSpent(SpentStore value) => newSpent = value;

  @action
  void setIdEstimate(String value) => idEstimate = value;

  @action
  void setErrorType(bool value) => errorType = value;

  @action
  void setErrorEstimate(bool value) => errorEstimate = value;

  @action
  void setErroName(bool value) => erroName = value;

  @action
  void setErroValue(bool value) => erroValue = value;

  @action
  void setErrorDate(bool value) => errorDate = value;

  @action
  void setEnableDate(bool value) => enableDate = value;

  @action
  void setEnableValue(bool value) => enableValue = value;

  @action
  void setEnableIdEstimate(bool value) => enableIdEstimate = value;

  @action
  void setIsEdit(bool value) => isEdit = value;

  @action
  void setIsSpentExpected(bool value) => isSpentExpected = value;

  @action
  void setType(String value) {
    type = value;
    setEnableExpectedGeneral(false);
    setEnableDate(type != TypeExpense.FIXED.index.toString());
    setIsSpentExpected(type == TypeExpense.EXPECTED.index.toString());
    setEnableIdEstimate(type != TypeExpense.FIXED.index.toString());
  }

  @action
  void setEnableExpectedGeneral(bool value) {
    enableExpectedGeneral = value;
    setEnableDate(!value);
    setEnableValue(!value);
    setEnableIdEstimate(!value);
  }

  @action
  void setMsgErroName(String value) => msgErroName = value;

  @action
  void createSpent(){
    if (type == TypeExpense.FIXED.index.toString()) {
      createSpentFixed();
    } else if (enableExpectedGeneral){
      createSpentExpectedGeneral();
    } else {
      createSpentVariedOrExpected();
    }
  }

  void createSpentFixed(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);
    money.fixedExpenses.insert(0, spent);
  }

  void createSpentExpectedGeneral(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);
    money.expectedExpenses.insert(0, spent);
  }

  void createSpentVariedOrExpected(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    
    money.estimates = money.estimates.map((estimate) {

      if (estimate.id == int.parse(idEstimate)){
        estimate.expenses = estimate.expenses.map((expense) {
          if (expense.type == getTypeFromIndex(type)){
            expense.spents.insert(0, spent);

            expense.setLastValue(double.parse(spent.value));
            expense.setValue(
              expense.spents.fold(0, (prev, item) => prev + double.parse(item.value))
            );
          }

          return expense;
        }).toList().asObservable();

        estimate.calculateFinalBalance(); 
      }

      return estimate;
    }).toList().asObservable(); 
  }

  /// 
  /// Atualiza o orçamento
  /// 
  @action
  void updateEstimate(String typeExpense, String idSpent){
    if (type == TypeExpense.FIXED.index.toString()) {
      updateSpentFixed();
    } else if (enableExpectedGeneral) {
      updateSpentExpected();
    } else {
      updateSpentExpectedOrVaried(typeExpense, idSpent);
    }
  }

  void updateSpentFixed(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);

    for (var i = 0; i < money.fixedExpenses.length; i++) {
      if (money.fixedExpenses[i].id == spent.id) {
        money.fixedExpenses[i] = spent;
      }
    }
  }

  void updateSpentExpected(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);

    for (var i = 0; i < money.expectedExpenses.length; i++) {
      if (money.expectedExpenses[i].id == spent.id) {
        money.expectedExpenses[i] = spent;
      }
    }
  }

  void updateSpentExpectedOrVaried(String typeExpense, String idSpent){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    
    money.estimates = money.estimates.map((estimate) {

      if (estimate.id == int.parse(idEstimate)){
        estimate.expenses = estimate.expenses.map((expense) {
          if (expense.type == getTypeFromIndex(typeExpense)){
            expense.spents = expense.spents.map((item) {
              
              if (item.id == spent.id) {
                return spent;
              }

              return item;
            }).toList().asObservable();

            expense.setLastValue(double.parse(spent.value));
            expense.setValue(
              expense.spents.fold(0, (prev, item) => prev + double.parse(item.value))
            );
          }

          return expense;
        }).toList().asObservable();

        estimate.calculateFinalBalance(); 
      }

      return estimate;
    }).toList().asObservable();
  }

  SpentStore prepareSpentToEdit({ 
    String typeExpense, 
    String idSpent,
    bool isFixedGeneral = false,
    bool isExpectedGeneral = false }){

    SpentStore editSpent;
    setType(typeExpense);

    if (isFixedGeneral) {
      editSpent = SpentStore()
        .fromJson(
          money.fixedExpenses.firstWhere(
            (spent) => spent.id == idSpent,
            orElse: () => null
          ).toJson()
        );
    } else if (isExpectedGeneral) {
      editSpent = SpentStore()
        .fromJson(
          money.expectedExpenses.firstWhere(
            (spent) => spent.id == idSpent,
            orElse: () => null
          ).toJson()
        );
      setEnableExpectedGeneral(true);
    } else {
      editSpent = SpentStore().fromJson(
        getSpentToEdit(typeExpense, idSpent).toJson()
      );
    }
    
    editSpent.setValue(getTwoPrecision(editSpent.value));
    setIsEdit(true);

    return editSpent;
  }

  SpentStore getSpentToEdit(String typeExpense, String idSpent){
    EstimateStore estimate =  money.estimates
      .firstWhere((item) => item.id == int.parse(idEstimate), orElse: () => null);

    if (estimate != null) {
      ExpenseStore expense = estimate.expenses.firstWhere(
        (expense) => expense.type == getTypeFromIndex(typeExpense),
        orElse: () => null
      );

      if (expense != null) {
        return expense.spents.firstWhere(
          (spent) => spent.id == idSpent,
          orElse: () => null
        );
      }
    }

    return null;
  }

  /// 
  /// Obtem o valor para o campo com duas casas decimais
  /// 
  String getTwoPrecision(String value) {
    return (value != null) ? double.parse(value).toStringAsFixed(2) : null;
  }

  bool validateSpent(){
    bool validType = validateType();
    bool validName = validateName();
    
    if (validType && validName) {

      if (type == TypeExpense.FIXED.index.toString()) {
        return validateValue();
      }

      if (!enableExpectedGeneral) {
        bool validValue = validateValue();
        bool validDate = validateDate();

        return validValue && validDate;
      }

      return true;
    }

    return false;
  }

  bool validateType() {
    if (type == null || type.isEmpty) {
      setErrorType(true);
      return false;
    }
    
    setErrorType(false);
    return true;
  }

  bool validateName(){
    newSpent.setTitle(newSpent.title == null ? null : newSpent.title.trim());
    
    if (newSpent.title == null || newSpent.title.isEmpty) {
      setMsgErroName('Nome inválido');
      setErroName(true);
      return false;
    }

    if (type == TypeExpense.FIXED.index.toString()) {
      var exist = money.fixedExpenses.firstWhere(
        (spent) => spent.title == newSpent.title,
        orElse: () => null
      );

      if (exist != null) {
        setMsgErroName('Ja existe um gasto fixo com esse nome');
        setErroName(true);
        return false;
      }
    }

    if (type == TypeExpense.EXPECTED.index.toString()) {
      var exist = money.expectedExpenses.firstWhere(
        (spent) => spent.title == newSpent.title,
        orElse: () => null
      );

      if (exist != null) {
        setMsgErroName('Ja existe um gasto previsto com esse nome');
        setErroName(true);
        return false;
      }
    }
    
    setErroName(false);
    return true;
  }

  bool validateValue() {
    if (newSpent.value == null || newSpent.value == '0.00') {
      setErroValue(true);
      return false;
    }
    
    setErroValue(false);
    return true;
  }

  bool validateDate() {
    if (newSpent.date == null || newSpent.date.isEmpty) {
      setErrorDate(true);
      return false;
    }
    
    setErrorDate(false);
    return true;
  }
}
