import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'estimate_store.g.dart';

@Injectable()
class EstimateStore extends _EstimateStoreBase with _$EstimateStore {
  EstimateStore({
    int id,
    String month,
    String startDay,
    String endDay,
    String salary,
    String openingBalance,
    String finalBalance,
    List<ExpenseStore> expenses: const [],
  }) : super(
    id: id,
    month: month,
    startDay: startDay,
    endDay: endDay,
    salary: salary,
    openingBalance: openingBalance,
    finalBalance: finalBalance,
    expenses: expenses
  );

  EstimateStore fromJson(Map<String, dynamic> json) {
    ObservableList<ExpenseStore> expenses = <ExpenseStore>[].asObservable();

    if (json['expenses'] != null) {
      json['expenses'].forEach((v) {
        expenses.add(new ExpenseStore().fromJson(v));
      });
    }

    return new EstimateStore(
      id: json['id'],
      month: json['month'],
      startDay: json['startDay'],
      endDay: json['endDay'],
      salary: json['salary'],
      openingBalance: json['openingBalance'],
      finalBalance: json['finalBalance'],
      expenses: expenses,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['month'] = this.month;
    data['startDay'] = this.startDay;
    data['endDay'] = this.endDay;
    data['salary'] = this.salary;
    data['openingBalance'] = this.openingBalance;
    data['finalBalance'] = this.finalBalance;
    if (this.expenses != null) {
      data['expenses'] = this.expenses.map((v) => v.toJson()).toList();
    }
    
    return data;
  }
}

abstract class _EstimateStoreBase with Store {
  
  @observable
  int id;

  @observable
  String month;

  @observable
  String startDay;

  @observable
  String endDay;

  @observable
  String salary;

  @observable
  String openingBalance;

  @observable
  String finalBalance;

  @observable
  ObservableList<ExpenseStore> expenses = <ExpenseStore>[].asObservable();

  _EstimateStoreBase({
    this.id,
    this.month,
    this.startDay,
    this.endDay,
    this.salary,
    this.openingBalance,
    this.finalBalance,
    List<ExpenseStore> expenses
  }){
    this.expenses = expenses.asObservable() ?? <ExpenseStore>[].asObservable();
  }

  @action
  setMonth(String value) => month = value;

  @action
  setStartDay(String value) => startDay = value;

  @action
  setEndDay(String value) => endDay = value;

  @action
  setSalary(String value) => salary = value;
  
  @action
  setOpeningBalance(String value) => openingBalance = value;
  
  @action
  setFinalBalance(String value) => finalBalance = value;
}
