import 'package:ella/app/modules/money/interfaces/local_storage.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:ella/app/shared/utils/item_select.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'spent_controller.g.dart';

@Injectable()
class SpentController = _SpentControllerBase with _$SpentController;

abstract class _SpentControllerBase with Store {
  
  final MoneyController money;

  final ILocalStorage _storage = Modular.get();

  @observable
  SpentStore newSpent;

  @observable
  int idNewSpent;

  @observable
  String type;

  @observable
  String idEstimate;

  @observable
  bool notEstimate = false;
  
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

  _SpentControllerBase(this.money){
    _init();
  }

  _init() async {
    int id = await _storage.getNextIdExpense();
    setIdNewSpent(id);
  }

  List<ItemSelect> types = [
    new ItemSelect(id: getIndexFromType(TypeExpense.FIXED), name: 'Fixo'),
    new ItemSelect(id: getIndexFromType(TypeExpense.EXPECTED), name: 'Previsto'),
    new ItemSelect(id: getIndexFromType(TypeExpense.VARIED), name: 'Variado'),
  ];

  List<ItemSelect> typesNotEstimate = [
    new ItemSelect(id: getIndexFromType(TypeExpense.FIXED), name: 'Fixo'),
    new ItemSelect(id: getIndexFromType(TypeExpense.EXPECTED), name: 'Previsto'),
  ];

  @action
  void setNewSpent(SpentStore value) => newSpent = value;

  @action
  void setIdNewSpent(int value) => idNewSpent = value;

  @action
  void setIdEstimate(String value) => idEstimate = value;

  @action
  void setNotEstimate(bool value) => notEstimate = value;

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

    if (notEstimate && type == TypeExpense.EXPECTED.index.toString()) {
      setEnableExpectedGeneral(true);
      setIsSpentExpected(false);
    }
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

  /// 
  /// Cria um gasto fixo
  /// 
  void createSpentFixed(){
    // adiciona na memoria
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);
    money.fixedExpenses.insert(0, spent);

    // adiciona no db
    _storage.putFixedExpense(int.parse(spent.id), spent.toJson());
  }

  /// 
  /// Cria um gasto esperado geral
  /// 
  void createSpentExpectedGeneral(){
    // adiciona na memoria
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);
    money.expectedExpenses.insert(0, spent);

    // adiciona no banco
    _storage.putExpectedExpense(int.parse(spent.id), spent.toJson());
  }

  /// 
  /// Cria um gasto variado ou esperado do orçamento
  /// 
  void createSpentVariedOrExpected(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    EstimateStore estimateEdited;

    money.estimates = money.estimates.map((estimate) {

      if (estimate.id == int.parse(idEstimate)){
        estimate.expenses = estimate.expenses.map((expense) {
          if (expense.type == getTypeFromIndex(type)){
            spent.setSelected(false);
            expense.spents.insert(0, spent);

            expense.setLastValue(double.parse(spent.value));
            expense.setValue(getValueExpense(expense.spents));
          }

          return expense;
        }).toList().asObservable();

        estimate.calculateFinalBalance();

        estimateEdited = EstimateStore().fromJson(estimate.toJson());
      }

      return estimate;
    }).toList().asObservable(); 

    // adiciona o gasto no banco
    _storage.putEstimate(
      estimateEdited.id, 
      estimateEdited.toJson(),
      insertSpent: true,
      keySpent: int.parse(spent.id)
    );
  }

  /// 
  /// Obtem o valor do tipo de gasto total com duas casas decimais
  ///
  double getValueExpense(List<SpentStore> selecteds){
    return double.parse(getTwoPrecision(
      selecteds.fold(0, (prev, item) => prev + double.parse(item.value)).toString()
    ));
  }

  /// 
  /// Atualiza os gastos
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

  /// 
  /// Atualiza o gasto fixo
  /// 
  void updateSpentFixed(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);

    for (var i = 0; i < money.fixedExpenses.length; i++) {
      if (money.fixedExpenses[i].id == spent.id) {
        money.fixedExpenses[i] = spent;
      }
    }

    // adiciona no banco
    _storage.putFixedExpense(int.parse(spent.id), spent.toJson());
  }

  /// 
  /// Atualiza os esperado
  /// 
  void updateSpentExpected(){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    spent.setSelected(false);

    for (var i = 0; i < money.expectedExpenses.length; i++) {
      if (money.expectedExpenses[i].id == spent.id) {
        money.expectedExpenses[i] = spent;
      }
    }

    // adiciona no banco
    _storage.putExpectedExpense(int.parse(spent.id), spent.toJson());
  }

  /// 
  /// Atualiza o gasto vinculado ao orçameto
  /// 
  void updateSpentExpectedOrVaried(String typeExpense, String idSpent){
    SpentStore spent = SpentStore().fromJson(newSpent.toJson());
    EstimateStore estimateEdited;

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
            expense.setValue(getValueExpense(expense.spents));
          }

          return expense;
        }).toList().asObservable();

        estimate.calculateFinalBalance();
        estimateEdited = EstimateStore().fromJson(estimate.toJson());
      }

      return estimate;
    }).toList().asObservable();

    // atualiza o gasto no banco
    _storage.putEstimate(
      estimateEdited.id, 
      estimateEdited.toJson(),
      insertSpent: true,
      keySpent: int.parse(spent.id)
    );
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
