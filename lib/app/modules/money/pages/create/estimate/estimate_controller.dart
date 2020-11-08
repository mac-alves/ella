import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:ella/app/shared/utils/list_of_months.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'estimate_controller.g.dart';

@Injectable()
class EstimateController = _EstimateControllerBase with _$EstimateController;

abstract class _EstimateControllerBase with Store {
  
  final MoneyController money;

  _EstimateControllerBase(this.money);

  final formKey = GlobalKey<FormState>();
  
  List<SpentStore> fixedExpenses = [
    new SpentStore(
      title: 'Aluguel',
      value: '400.00',
      selected: false
    ),
    new SpentStore(
      title: 'Cartão de crédito',
      value: '264.00',
      selected: false
    ),
  ];

  @observable
  SpentStore savings = new SpentStore(
    title: 'Poupança',
    value: null,
    selected: false,
    date: DateFormat('yyyy/MM/dd').format(DateTime.now())
  );

  @observable
  EstimateStore newEstimate;

  @observable
  bool errorMonth = false;
  
  @observable
  bool errorStartDay = false;

  @observable
  bool errorEndDay = false;

  @observable
  bool errorSavings = false;

  @action
  void setNewEstimate(EstimateStore value) => newEstimate = value;
  
  @action
  void setErrorMonth(bool value) => errorMonth = value;
  
  @action
  void setErrorStartDay(bool value) => errorStartDay = value;
  
  @action
  void setErrorEndDay(bool value) => errorEndDay = value;

  @action
  void setErrorSavings(bool value) => errorSavings = value;

  @action
  void setEnableSavings() {
    savings.setSelected();
    setErrorSavings(false);
  }

  /// 
  /// Cria um novo orçamento
  /// 
  @action
  void createEstimate(){
    money.estimates.add(getFormatedEstimate());
  }

  /// 
  /// Cria um novo orçamento
  /// 
  @action
  void updateEstimate(){
    EstimateStore estimateEdited = getFormatedEstimate();

    for (var i = 0; i < money.estimates.length; i++) {
      if (money.estimates[i].id == estimateEdited.id) {
        money.estimates[i] = estimateEdited;
      }
    }
  }

  /// 
  /// Obtem o orçamento formatado para criação ou atualização
  ///
  EstimateStore getFormatedEstimate(){
    EstimateStore estimate = EstimateStore().fromJson(newEstimate.toJson());

    estimate.expenses = getExpenses().asObservable();
    estimate.setFinalBalance(getFinalBalance(estimate.expenses).toString());
    estimate.setMonth(getMonth());

    return estimate;
  }

  /// 
  /// Obtem os gastos para a criação do orçamento
  /// 
  List<ExpenseStore> getExpenses(){
    bool hasSpend = false;
    bool hasSavings = false;

    List<SpentStore> selectedSpend = fixedExpenses
      .where((element) => element.selected).toList();

    if (selectedSpend.length > 0) {
      hasSpend = true;
    }

    if (savings.selected){
      hasSavings = true;
    }

    return [
      new ExpenseStore(
        type: TypeExpense.FIXED,
        lastValue: hasSpend 
          ? double.parse(selectedSpend[selectedSpend.length - 1].value)
          : 0.0,
        value: hasSpend 
          ? selectedSpend.fold(0, (prev, item) => prev + double.parse(item.value))
          : 0.0,
        spents: hasSpend ? selectedSpend : []
      ),
      new ExpenseStore(
        type: TypeExpense.EXPECTED,
        lastValue: hasSavings ? double.parse(savings.value) : 0.0,
        value: hasSavings ? double.parse(savings.value) : 0.0,
        spents: hasSavings ? [savings] : []
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
  /// Obtem o valor final do orçamento criado
  /// (valor em conta - somatorio dos gastos)
  /// 
  double getFinalBalance(List<ExpenseStore> listExpenses){
    double opening = double.parse(newEstimate.openingBalance);
    double sumOfExpenses = listExpenses.fold(0, (prev, item) => prev + item.value);
    return double.parse((opening - sumOfExpenses).toStringAsFixed(2));
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

    setFixedsSpentOfEstimate(editEstimate);
    setSavingsOfEstimate(editEstimate);

    editEstimate.setMonth(getIdByMonth(editEstimate.month.split('/')[0]));
    editEstimate.setSalary(getTwoPrecision(editEstimate.salary));
    editEstimate.setOpeningBalance(getTwoPrecision(editEstimate.openingBalance));
    
    return editEstimate;
  }

  /// 
  /// Seleciona os gastos fixo de um orçamento para edição
  /// 
  void setFixedsSpentOfEstimate(EstimateStore estimate){
    ExpenseStore fixeds = estimate.expenses
      .firstWhere((item) => item.type == TypeExpense.FIXED);

    var spentsFixeds = fixeds.spents.map((item) => item.title).toList();
    
    for (var i = 0; i < fixedExpenses.length; i++) {
      if (spentsFixeds.contains(fixedExpenses[i].title)) {
        fixedExpenses[i].setSelected();
      }
    }
  }

  /// 
  /// Atribui o valor da poupança do orçamento para edição
  /// 
  void setSavingsOfEstimate(EstimateStore estimate){
    ExpenseStore expecteds = estimate.expenses
      .firstWhere((item) => item.type == TypeExpense.EXPECTED);
    
    SpentStore savingsEstimate = expecteds.spents
        .firstWhere((item) => item.title == 'Poupança', orElse: () => null);
      
    if (savingsEstimate != null) {
      savings.value = getTwoPrecision(savingsEstimate.value);
      savings.selected = true;
    }   
  }

  bool validateEstimate(){
    bool validFields = formKey.currentState.validate();
    bool validMonth = validateMonth();
    bool validStartDay = validateStartDay();
    bool validEndDay = validateEndDay();
    
    if (validFields && validMonth && validStartDay && validEndDay) {
      if (savings.selected) {
        return validateSavings();
      }

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

  bool validateSavings(){
    if (savings.value == null || savings.value.isEmpty) {
      setErrorSavings(true);
      return false;
    }

    setErrorSavings(false);
    return true;
  }
}