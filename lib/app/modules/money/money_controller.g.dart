// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MoneyController = BindInject(
  (i) => MoneyController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoneyController on _MoneyControllerBase, Store {
  final _$estimatesAtom = Atom(name: '_MoneyControllerBase.estimates');

  @override
  ObservableList<EstimateStore> get estimates {
    _$estimatesAtom.reportRead();
    return super.estimates;
  }

  @override
  set estimates(ObservableList<EstimateStore> value) {
    _$estimatesAtom.reportWrite(value, super.estimates, () {
      super.estimates = value;
    });
  }

  final _$fixedExpensesAtom = Atom(name: '_MoneyControllerBase.fixedExpenses');

  @override
  ObservableList<SpentStore> get fixedExpenses {
    _$fixedExpensesAtom.reportRead();
    return super.fixedExpenses;
  }

  @override
  set fixedExpenses(ObservableList<SpentStore> value) {
    _$fixedExpensesAtom.reportWrite(value, super.fixedExpenses, () {
      super.fixedExpenses = value;
    });
  }

  final _$expectedExpensesAtom =
      Atom(name: '_MoneyControllerBase.expectedExpenses');

  @override
  ObservableList<SpentStore> get expectedExpenses {
    _$expectedExpensesAtom.reportRead();
    return super.expectedExpenses;
  }

  @override
  set expectedExpenses(ObservableList<SpentStore> value) {
    _$expectedExpensesAtom.reportWrite(value, super.expectedExpenses, () {
      super.expectedExpenses = value;
    });
  }

  final _$_MoneyControllerBaseActionController =
      ActionController(name: '_MoneyControllerBase');

  @override
  EstimateStore getEstimate(int id) {
    final _$actionInfo = _$_MoneyControllerBaseActionController.startAction(
        name: '_MoneyControllerBase.getEstimate');
    try {
      return super.getEstimate(id);
    } finally {
      _$_MoneyControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estimates: ${estimates},
fixedExpenses: ${fixedExpenses},
expectedExpenses: ${expectedExpenses}
    ''';
  }
}
