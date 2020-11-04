// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EstimateStore = BindInject(
  (i) => EstimateStore(
      id: i<int>(),
      month: i<String>(),
      startDay: i<String>(),
      endDay: i<String>(),
      salary: i<String>(),
      openingBalance: i<String>(),
      finalBalance: i<String>(),
      expenses: i<List<ExpenseStore>>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstimateStore on _EstimateStoreBase, Store {
  final _$idAtom = Atom(name: '_EstimateStoreBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$monthAtom = Atom(name: '_EstimateStoreBase.month');

  @override
  String get month {
    _$monthAtom.reportRead();
    return super.month;
  }

  @override
  set month(String value) {
    _$monthAtom.reportWrite(value, super.month, () {
      super.month = value;
    });
  }

  final _$startDayAtom = Atom(name: '_EstimateStoreBase.startDay');

  @override
  String get startDay {
    _$startDayAtom.reportRead();
    return super.startDay;
  }

  @override
  set startDay(String value) {
    _$startDayAtom.reportWrite(value, super.startDay, () {
      super.startDay = value;
    });
  }

  final _$endDayAtom = Atom(name: '_EstimateStoreBase.endDay');

  @override
  String get endDay {
    _$endDayAtom.reportRead();
    return super.endDay;
  }

  @override
  set endDay(String value) {
    _$endDayAtom.reportWrite(value, super.endDay, () {
      super.endDay = value;
    });
  }

  final _$salaryAtom = Atom(name: '_EstimateStoreBase.salary');

  @override
  String get salary {
    _$salaryAtom.reportRead();
    return super.salary;
  }

  @override
  set salary(String value) {
    _$salaryAtom.reportWrite(value, super.salary, () {
      super.salary = value;
    });
  }

  final _$openingBalanceAtom = Atom(name: '_EstimateStoreBase.openingBalance');

  @override
  String get openingBalance {
    _$openingBalanceAtom.reportRead();
    return super.openingBalance;
  }

  @override
  set openingBalance(String value) {
    _$openingBalanceAtom.reportWrite(value, super.openingBalance, () {
      super.openingBalance = value;
    });
  }

  final _$finalBalanceAtom = Atom(name: '_EstimateStoreBase.finalBalance');

  @override
  String get finalBalance {
    _$finalBalanceAtom.reportRead();
    return super.finalBalance;
  }

  @override
  set finalBalance(String value) {
    _$finalBalanceAtom.reportWrite(value, super.finalBalance, () {
      super.finalBalance = value;
    });
  }

  final _$expensesAtom = Atom(name: '_EstimateStoreBase.expenses');

  @override
  ObservableList<ExpenseStore> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(ObservableList<ExpenseStore> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  final _$_EstimateStoreBaseActionController =
      ActionController(name: '_EstimateStoreBase');

  @override
  dynamic setMonth(String value) {
    final _$actionInfo = _$_EstimateStoreBaseActionController.startAction(
        name: '_EstimateStoreBase.setMonth');
    try {
      return super.setMonth(value);
    } finally {
      _$_EstimateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setStartDay(String value) {
    final _$actionInfo = _$_EstimateStoreBaseActionController.startAction(
        name: '_EstimateStoreBase.setStartDay');
    try {
      return super.setStartDay(value);
    } finally {
      _$_EstimateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEndDay(String value) {
    final _$actionInfo = _$_EstimateStoreBaseActionController.startAction(
        name: '_EstimateStoreBase.setEndDay');
    try {
      return super.setEndDay(value);
    } finally {
      _$_EstimateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSalary(String value) {
    final _$actionInfo = _$_EstimateStoreBaseActionController.startAction(
        name: '_EstimateStoreBase.setSalary');
    try {
      return super.setSalary(value);
    } finally {
      _$_EstimateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOpeningBalance(String value) {
    final _$actionInfo = _$_EstimateStoreBaseActionController.startAction(
        name: '_EstimateStoreBase.setOpeningBalance');
    try {
      return super.setOpeningBalance(value);
    } finally {
      _$_EstimateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalBalance(String value) {
    final _$actionInfo = _$_EstimateStoreBaseActionController.startAction(
        name: '_EstimateStoreBase.setFinalBalance');
    try {
      return super.setFinalBalance(value);
    } finally {
      _$_EstimateStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
month: ${month},
startDay: ${startDay},
endDay: ${endDay},
salary: ${salary},
openingBalance: ${openingBalance},
finalBalance: ${finalBalance},
expenses: ${expenses}
    ''';
  }
}
