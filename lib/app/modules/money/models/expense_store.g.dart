// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ExpenseStore = BindInject(
  (i) => ExpenseStore(
      type: i<TypeExpense>(),
      value: i<double>(),
      lastValue: i<double>(),
      spents: i<List<SpentStore>>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExpenseStore on _ExpenseStoreBase, Store {
  final _$typeAtom = Atom(name: '_ExpenseStoreBase.type');

  @override
  TypeExpense get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(TypeExpense value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$valueAtom = Atom(name: '_ExpenseStoreBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$lastValueAtom = Atom(name: '_ExpenseStoreBase.lastValue');

  @override
  double get lastValue {
    _$lastValueAtom.reportRead();
    return super.lastValue;
  }

  @override
  set lastValue(double value) {
    _$lastValueAtom.reportWrite(value, super.lastValue, () {
      super.lastValue = value;
    });
  }

  final _$spentsAtom = Atom(name: '_ExpenseStoreBase.spents');

  @override
  ObservableList<SpentStore> get spents {
    _$spentsAtom.reportRead();
    return super.spents;
  }

  @override
  set spents(ObservableList<SpentStore> value) {
    _$spentsAtom.reportWrite(value, super.spents, () {
      super.spents = value;
    });
  }

  final _$_ExpenseStoreBaseActionController =
      ActionController(name: '_ExpenseStoreBase');

  @override
  dynamic setType(TypeExpense value) {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(double newValue) {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLastValue(double value) {
    final _$actionInfo = _$_ExpenseStoreBaseActionController.startAction(
        name: '_ExpenseStoreBase.setLastValue');
    try {
      return super.setLastValue(value);
    } finally {
      _$_ExpenseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
value: ${value},
lastValue: ${lastValue},
spents: ${spents}
    ''';
  }
}
