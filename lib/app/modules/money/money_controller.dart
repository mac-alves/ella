import 'package:ella/app/shared/utils/list_of_months.dart';
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
  
  List<ItemSelect> idsEstimates = [
    new ItemSelect(id: 23.toString(), name: 'Julho/20'),
    new ItemSelect(id: 50.toString(), name: 'Agosto/20'),
  ];

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
              id: '0',
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
              id: '2',
              title: 'Poupança',
              value: '10.66',
              selected: true,
              date: '2020/11/07'
            )
          ]
        ),
        ExpenseStore(
          type: TypeExpense.VARIED,
          lastValue: 45.05,
          value: 45.05,
          spents: [
            new SpentStore(
              id: '3',
              title: 'Janta',
              value: '45.05',
              selected: true,
              date: '2020/11/07'
            )
          ]
        ),
      ],
    ),
    EstimateStore(
      id: 50,
      month: 'Agosto/20',
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
              id: '1',
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
              id: '3',
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

  @observable
  ObservableList<SpentStore> fixedExpenses = [
    new SpentStore(
      id: '0',
      title: 'Aluguel',
      value: '400.00',
      selected: false
    )
  ].asObservable();

  @observable
  ObservableList<SpentStore> expectedExpenses = [
    new SpentStore(
      id: '1',
      title: 'Poupança',
      value: null,
      selected: false,
      date: null
    ),
    new SpentStore(
      id: '2',
      title: 'Cartão de crédito',
      value: null,
      selected: false,
      date: null
    ),
  ].asObservable();

  _MoneyControllerBase();

  @action
  EstimateStore getEstimate(int id){
    return estimates.firstWhere((element) => element.id == id, orElse: () => null);
  }
}
