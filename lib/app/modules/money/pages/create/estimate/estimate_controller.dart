import 'package:ella/app/modules/money/interfaces/local_storage.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:ella/app/shared/utils/enum_states.dart';
import 'package:ella/app/shared/utils/item_select.dart';
import 'package:ella/app/shared/utils/list_of_months.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'estimate_controller.g.dart';

@Injectable()
class EstimateController = _EstimateControllerBase with _$EstimateController;

abstract class _EstimateControllerBase with Store {
  
  final ILocalStorage _storage = Modular.get();
  
  final MoneyController money;

  final formKeyExtimateFields = GlobalKey<FormState>();
  final formKeyExpectedFields = GlobalKey<FormState>();

  @observable
  ObservableList<SpentStore> fixedExpensesOfEstimate = <SpentStore>[].asObservable();

  @observable
  ObservableList<SpentStore> fixedGeneralExpenses = <SpentStore>[].asObservable();

  @observable
  ObservableList<SpentStore> expectedExpenses = <SpentStore>[].asObservable();

  _EstimateControllerBase(this.money) {
    _init();
  }

  _init() async {
    int id = await _storage.getNextIdEstimate();
    setIdNewEstimate(id);
  }

  setExpenses() async {
    var localFixedExpenses = await _storage.getAllFixedExpenses();
    var localExpectedExpenses = await _storage.getAllExpectedExpenses();

    if (localFixedExpenses == null) {
      fixedGeneralExpenses = <SpentStore>[].asObservable();
    } else {
      fixedGeneralExpenses = localFixedExpenses.asObservable();
    }

    if (localExpectedExpenses == null) {
      expectedExpenses = <SpentStore>[].asObservable();
    } else {
      expectedExpenses = localExpectedExpenses.asObservable();
    }

    setCurrentStateExpense(States.SUCESS);
  }

  // @observable
  // States currentStateId = States.LOADING;

  @observable
  States currentStateExpense = States.LOADING;

  @observable
  EstimateStore newEstimate;

  @observable
  int idNewEstimate;

  @observable
  bool errorMonth = false;
  
  @observable
  bool errorStartDay = false;

  @observable
  bool errorEndDay = false;

  @observable
  bool errorSavings = false;

  @observable
  bool isEdit = false;

  // @action
  // void setCurrentStateId(States value) => currentStateId = value;

  @action
  void setCurrentStateExpense(States value) => currentStateExpense = value;

  @action
  void setNewEstimate(EstimateStore value) => newEstimate = value;

  @action
  void setIdNewEstimate(int value) => idNewEstimate = value;
  
  @action
  void setErrorMonth(bool value) => errorMonth = value;
  
  @action
  void setErrorStartDay(bool value) => errorStartDay = value;
  
  @action
  void setErrorEndDay(bool value) => errorEndDay = value;

  @action
  void setErrorSavings(bool value) => errorSavings = value;

  @action
  void setIsEdit(bool value) => isEdit = value;

  List<SpentStore> getNewList(ObservableList<SpentStore> list) {
    return list.map((e) => SpentStore().fromJson(e.toJson())).toList();
  }

  /// 
  /// Cria um novo orçamento
  /// 
  @action
  void createEstimate() {
    EstimateStore estimate = getFormatedEstimate();
    
    ItemSelect id = ItemSelect(
      id: estimate.id.toString(), 
      name: estimate.month
    );
    
    // verifica se o que consta é o vazio
    if ((money.estimates.length == 1) && (money.estimates[0].id == -1)) {
      money.estimates = <EstimateStore>[].asObservable();
    }

    // cria na memoria
    money.estimates.add(estimate);
    money.idsEstimates.add(id);

    try {
      // cria no db
      _storage.putEstimate(estimate.id, estimate.toJson());
      _storage.putIdEstimate(int.parse(id.id), id.toJson());
      
    } catch (e) {
      print(e);
    }    
  }

  /// 
  /// Atualiza o orçamento
  /// 
  @action
  void updateEstimate() {
    EstimateStore estimateEdited = getFormatedEstimate();

    ItemSelect id = ItemSelect(
      id: estimateEdited.id.toString(), 
      name: estimateEdited.month
    );

    // atualiza na lista de orçamentos
    for (var i = 0; i < money.estimates.length; i++) {
      if (money.estimates[i].id == estimateEdited.id) {
        money.estimates[i] = estimateEdited;
      }
    }

    // atualzia a lista de ids dos orçamentos
    for (var i = 0; i < money.idsEstimates.length; i++) {
      if (money.idsEstimates[i].id == id.id) {
        money.idsEstimates[i] = id;
      }
    }

    try {
      // cria no db
      _storage.putEstimate(estimateEdited.id, estimateEdited.toJson());
      _storage.putIdEstimate(int.parse(id.id), id.toJson());
      
    } catch (e) {
      print(e);
    } 
  }

  /// 
  /// Deleta o orçamento
  /// 
  void deleteEstimate(){
    money.estimates.removeWhere((item) => item.id == newEstimate.id);
    money.idsEstimates.removeWhere((item) => int.parse(item.id) == newEstimate.id);

    try {
      _storage.deleteEstimate(newEstimate.id);
    } catch (e) {
      print(e);
    } 
  }

  /// 
  /// Obtem o orçamento formatado para criação ou atualização
  ///
  EstimateStore getFormatedEstimate() {
    EstimateStore estimate = EstimateStore().fromJson(newEstimate.toJson());

    estimate.setMonth(getMonth());
    estimate.expenses = getExpenses().asObservable();
    estimate.calculateFinalBalance();

    return estimate;
  }

  /// 
  /// Obtem os gastos para a criação do orçamento
  /// 
  List<ExpenseStore> getExpenses(){
    bool hasFixeds = false;
    bool hasExpecteds = false;

    List<SpentStore> selectedFixeds = fixedGeneralExpenses
      .where((element) => element.selected)
      .map((item) {
        item.setSelected(false);
        return item;
      }).toList();

    if (isEdit) {
      selectedFixeds.addAll(fixedExpensesOfEstimate);
    }

    if (selectedFixeds.length > 0) {
      selectedFixeds = selectedFixeds
        .map((spent) {
          spent.setId(
            (int.parse(spent.id) + DateTime.now().millisecondsSinceEpoch)
            .toString()
          );
          return spent;
        })
        .toList();

      hasFixeds = true;
    }

    List<SpentStore> selectedExpecteds = expectedExpenses
      .where((element) => element.selected)
      .map((item) {
        item.setSelected(false);
        return item;
      }).toList();

    if (selectedExpecteds.length > 0){
      selectedExpecteds = selectedExpecteds.map((spent) {
        spent.setId(
          (int.parse(spent.id) + DateTime.now().millisecondsSinceEpoch)
          .toString()
        );
        spent.setDate(new DateFormat('yyyy/MM/dd').format(DateTime.now()));
        return spent;
      }).toList();
      hasExpecteds = true;
    }

    return [
      new ExpenseStore(
        type: TypeExpense.FIXED,
        lastValue: hasFixeds 
          ? double.parse(selectedFixeds[selectedFixeds.length - 1].value)
          : 0.0,
        value: hasFixeds 
          ? selectedFixeds.fold(0, (prev, item) => prev + double.parse(item.value))
          : 0.0,
        spents: hasFixeds ? selectedFixeds : []
      ),
      new ExpenseStore(
        type: TypeExpense.EXPECTED,
        lastValue: hasExpecteds 
          ? double.parse(selectedExpecteds[selectedExpecteds.length - 1].value) 
          : 0.0,
        value: hasExpecteds 
          ? selectedExpecteds.fold(0, (prev, item) => prev + double.parse(item.value)) 
          : 0.0,
        spents: hasExpecteds ? selectedExpecteds : []
      ),
      new ExpenseStore(
        type: TypeExpense.VARIED,
        lastValue: 0.0,
        value: 0.0,
        spents: []
      ),
    ];
  }

  /// 
  /// Obtem o valor para o campo com duas casas decimais
  /// 
  String getTwoPrecision(String value){
    return double.parse(value).toStringAsFixed(2);
  }

  /// 
  /// Formata o mes ao criar o orçamento
  /// 
  String getMonth(){
    String month = getMonthById(newEstimate.month);
    String year = DateFormat('yy').format(DateTime.now());

    return month+'/'+year;
  }

  /// 
  /// Prepara o orçamento para edição
  /// 
  EstimateStore prepareEstimateEdit(EstimateStore estimate){
    EstimateStore editEstimate = EstimateStore().fromJson(estimate.toJson());

    setSpentsOfEstimate(editEstimate);

    editEstimate.setMonth(getIdByMonth(editEstimate.month.split('/')[0]));
    editEstimate.setSalary(getTwoPrecision(editEstimate.salary));
    editEstimate.setOpeningBalance(getTwoPrecision(editEstimate.openingBalance));
    
    return editEstimate;
  }

  Future setSpentsOfEstimate(EstimateStore editEstimate) async {
    await setExpenses();
    setFixedsSpentOfEstimate(editEstimate);
    setExpectedOfEstimate(editEstimate); 
  }

  /// 
  /// Seleciona os gastos fixo de um orçamento para edição
  /// 
  void setFixedsSpentOfEstimate(EstimateStore estimate){

    fixedGeneralExpenses = <SpentStore>[].asObservable();

    List<SpentStore> general = getNewList(money.fixedExpenses);
    fixedExpensesOfEstimate = estimate.expenses
      .firstWhere((item) => item.type == TypeExpense.FIXED).spents;

    List<String> spentsFixeds = fixedExpensesOfEstimate
      .map((item) => formateToCompare(item)).toList();

    for (var i = 0; i < general.length; i++) {
      bool contain = spentsFixeds.contains(formateToCompare(general[i]));

      if (!contain) {
        fixedGeneralExpenses.add(general[i]);
      }
    }
  }

  String formateToCompare(SpentStore spent){
    return '${spent.title}:${spent.value}';
  }

  /// 
  /// Atribui os gastos esperados do orçamento para edição
  /// 
  void setExpectedOfEstimate(EstimateStore estimate){
    expectedExpenses = <SpentStore>[].asObservable();
    List<SpentStore> general = getNewList(money.expectedExpenses);
    List<SpentStore> expecteds = estimate.expenses
      .firstWhere((item) => item.type == TypeExpense.EXPECTED).spents;

    List<String> titleExpected = expecteds.map((item) => item.title).toList();

    for (var i = 0; i < general.length; i++) {
      bool contain = titleExpected.contains(general[i].title);

      if (contain) {
        SpentStore item = expecteds
          .firstWhere((item) => item.title == general[i].title);

        expecteds.remove(item);

        item.setSelected(true);
        item.setValue(getTwoPrecision(item.value));
        expectedExpenses.add(item);
      } else {
        expectedExpenses.add(general[i]);
      }
    }

    if (expecteds.length > 0) {
      List<SpentStore> spents = expecteds.map((item) {
        item.setSelected(true); 
        item.setValue(getTwoPrecision(item.value));
        return item;
      }).toList();

      expectedExpenses.addAll(spents);
    }
  }

  bool validateEstimate(){
    bool validFieldsEstimate = formKeyExtimateFields.currentState.validate();
    bool validFieldsExpected = formKeyExpectedFields.currentState.validate();
    bool validMonth = validateMonth();
    bool validStartDay = validateStartDay();
    bool validEndDay = validateEndDay();

    if (
      validFieldsEstimate && validFieldsExpected && 
      validMonth && validStartDay && validEndDay) {

      return true;
    }

    return false;
  }

  bool validateMonth(){
    if (newEstimate.month == null || newEstimate.month.isEmpty) {
      setErrorMonth(true);
      return false;
    }
    
    setErrorMonth(false);
    return true;
  }

  bool validateStartDay(){
    if (newEstimate.startDay == null || newEstimate.startDay.isEmpty) {
      setErrorStartDay(true);
      return false;
    }

    setErrorStartDay(false);
    return true;
  }

  bool validateEndDay(){
    if (newEstimate.endDay == null || newEstimate.endDay.isEmpty) {
      setErrorEndDay(true);
      return false;
    }

    setErrorEndDay(false);
    return true;
  }
}