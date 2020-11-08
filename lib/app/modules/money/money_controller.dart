import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/estimate_store.dart';
import 'models/expense_store.dart';
import 'models/spent_store.dart';
import 'models/type_expense.dart';

part 'money_controller.g.dart';

@Injectable()
class MoneyController = _MoneyControllerBase with _$MoneyController;

abstract class _MoneyControllerBase with Store {
  
  @observable
  ObservableList<EstimateStore> estimates = [
    EstimateStore(
      id: 23,
      month: 'Julho/20',
      startDay: '2020/09/01',
      endDay: '2020/10/01',
      salary: '200.00',
      openingBalance: '210.00',
      finalBalance: '160.00',
      expenses: [
        ExpenseStore(
          type: TypeExpense.FIXED,
          lastValue: 18.05,
          value: 55.36, 
          spents: [
            new SpentStore(
              title: 'Aluguel',
              value: '400.00',
              selected: false
            ),
          ]
        ),
        ExpenseStore(
          type: TypeExpense.EXPECTED,
          lastValue: 45.50,
          value: 86.03,
          spents: [
            new SpentStore(
              title: 'Poupança',
              value: '10.66',
              selected: true,
              date: '2020/11/07'
            )
          ]
        ),
        ExpenseStore(type: TypeExpense.VARIED,lastValue: 45.05,value: 77.30),
      ],
    ),
    EstimateStore(
      id: 50,
      month: 'Julho/20',
      startDay: '2020/09/01',
      endDay: '2020/10/01',
      salary: '200.00',
      openingBalance: '210.00',
      finalBalance: '160.00',
      expenses: [
        ExpenseStore(
          type: TypeExpense.FIXED,
          lastValue: 18.50,
          value: 55.30, 
          spents: [
            new SpentStore(
              title: 'Cartão de crédito',
              value: '264.00',
              selected: false
            ),
          ]
        ),
        ExpenseStore(
          type: TypeExpense.EXPECTED,
          lastValue: 45.50,
          value: 86.36,
          spents: [
            new SpentStore(
              title: 'Poupança',
              value: '65.00',
              selected: true,
              date: '2020/11/07'
            )
          ]
        ),
        ExpenseStore(type: TypeExpense.VARIED,lastValue: 45.50,value: 77.36),
      ],
    ),
  ].asObservable();

  _MoneyControllerBase();

  @action
  EstimateStore getEstimate(int id){
    return estimates.firstWhere((element) => element.id == id);
  }
}
