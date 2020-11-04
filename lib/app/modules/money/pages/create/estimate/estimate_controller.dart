import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'estimate_controller.g.dart';

@Injectable()
class EstimateController = _EstimateControllerBase with _$EstimateController;

abstract class _EstimateControllerBase with Store {
  
  final formKey = GlobalKey<FormState>();

  List<SpentStore> fixedExpenses = [
    new SpentStore(
      title: 'Aluguel',
      value: 400.0,
      selected: false
    ),
    new SpentStore(
      title: 'Cartão de crédito',
      value: 400.0,
      selected: false
    ),
  ];

  @observable
  ExpenseStore selectedFixedExpenses = new ExpenseStore(
    type: TypeExpense.FIXED
  );
  
  @observable
  ExpenseStore selectedVariedExpenses = new ExpenseStore(
    type: TypeExpense.VARIED
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
  bool enableSaving = false;

  @action
  void setNewEstimate(EstimateStore value) => newEstimate = value;
  
  @action
  void setErrorMonth(bool value) => errorMonth = value;
  
  @action
  void setErrorStartDay(bool value) => errorStartDay = value;
  
  @action
  void setErrorEndDay(bool value) => errorEndDay = value;

  @action
  void setEnableSaving(bool value) => enableSaving = value;

  bool validateEstimate(){
    bool validFields = formKey.currentState.validate();
    bool validMonth = validateMonth();
    bool validStartDay = validateStartDay();
    bool validEndDay = validateEndDay();
    
    if (validFields && validMonth && validStartDay && validEndDay) {
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