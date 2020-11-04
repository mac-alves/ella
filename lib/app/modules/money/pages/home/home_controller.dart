import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store implements Disposable {
  final pageController = PageController(initialPage: 1);

  @observable
  ObservableList<EstimateStore> estimates = [
    EstimateStore(
      month: 'Julho/20',
      startDay: '01/09',
      endDay: '01/10',
      salary: '200',
      openingBalance: '210',
      finalBalance: '160',
      expenses: [
        ExpenseStore(type: TypeExpense.FIXED,lastValue: 18.5,value: 55.3),
        ExpenseStore(type: TypeExpense.EXPECTED,lastValue: 37.5,value: 48.3),
        ExpenseStore(type: TypeExpense.VARIED,lastValue: 78.5,value: 62.3),
      ],
    ),
    EstimateStore(
      month: 'Agosto/20',
      startDay: '01/09',
      endDay: '01/10',
      salary: '200',
      openingBalance: '210',
      finalBalance: '788',
      expenses: [
        ExpenseStore(type: TypeExpense.FIXED,lastValue: 75.5,value: 66.3),
        ExpenseStore(type: TypeExpense.EXPECTED,lastValue: 45.5,value: 86.3),
        ExpenseStore(type: TypeExpense.VARIED,lastValue: 45.5,value: 77.3),
      ],
    ),
    EstimateStore(
      month: 'Setembo/20',
      startDay: '01/09',
      endDay: '01/10',
      salary: '200',
      openingBalance: '210',
      finalBalance: '426',
      expenses: [
        ExpenseStore(type: TypeExpense.FIXED,lastValue: 37.5,value: 458.3),
        ExpenseStore(type: TypeExpense.EXPECTED,lastValue: 55.5,value: 371.3),
        ExpenseStore(type: TypeExpense.VARIED,lastValue: 378.5,value: 58.3),
      ],
    ),
  ].asObservable();

  _HomeControllerBase(){
    setCurrentEstimate(estimates.length - 1);
  }

  @observable
  EstimateStore currentEstimate;

  @action
  void setCurrentEstimate(int index) {
    currentEstimate = estimates.elementAt(index);
  }

  @override
  void dispose(){
    pageController.dispose();
  }
}
