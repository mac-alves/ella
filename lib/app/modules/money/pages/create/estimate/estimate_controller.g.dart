// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EstimateController = BindInject(
  (i) => EstimateController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstimateController on _EstimateControllerBase, Store {
  final _$selectedFixedExpensesAtom =
      Atom(name: '_EstimateControllerBase.selectedFixedExpenses');

  @override
  ExpenseStore get selectedFixedExpenses {
    _$selectedFixedExpensesAtom.reportRead();
    return super.selectedFixedExpenses;
  }

  @override
  set selectedFixedExpenses(ExpenseStore value) {
    _$selectedFixedExpensesAtom.reportWrite(value, super.selectedFixedExpenses,
        () {
      super.selectedFixedExpenses = value;
    });
  }

  final _$selectedVariedExpensesAtom =
      Atom(name: '_EstimateControllerBase.selectedVariedExpenses');

  @override
  ExpenseStore get selectedVariedExpenses {
    _$selectedVariedExpensesAtom.reportRead();
    return super.selectedVariedExpenses;
  }

  @override
  set selectedVariedExpenses(ExpenseStore value) {
    _$selectedVariedExpensesAtom
        .reportWrite(value, super.selectedVariedExpenses, () {
      super.selectedVariedExpenses = value;
    });
  }

  final _$newEstimateAtom = Atom(name: '_EstimateControllerBase.newEstimate');

  @override
  EstimateStore get newEstimate {
    _$newEstimateAtom.reportRead();
    return super.newEstimate;
  }

  @override
  set newEstimate(EstimateStore value) {
    _$newEstimateAtom.reportWrite(value, super.newEstimate, () {
      super.newEstimate = value;
    });
  }

  final _$errorMonthAtom = Atom(name: '_EstimateControllerBase.errorMonth');

  @override
  bool get errorMonth {
    _$errorMonthAtom.reportRead();
    return super.errorMonth;
  }

  @override
  set errorMonth(bool value) {
    _$errorMonthAtom.reportWrite(value, super.errorMonth, () {
      super.errorMonth = value;
    });
  }

  final _$errorStartDayAtom =
      Atom(name: '_EstimateControllerBase.errorStartDay');

  @override
  bool get errorStartDay {
    _$errorStartDayAtom.reportRead();
    return super.errorStartDay;
  }

  @override
  set errorStartDay(bool value) {
    _$errorStartDayAtom.reportWrite(value, super.errorStartDay, () {
      super.errorStartDay = value;
    });
  }

  final _$errorEndDayAtom = Atom(name: '_EstimateControllerBase.errorEndDay');

  @override
  bool get errorEndDay {
    _$errorEndDayAtom.reportRead();
    return super.errorEndDay;
  }

  @override
  set errorEndDay(bool value) {
    _$errorEndDayAtom.reportWrite(value, super.errorEndDay, () {
      super.errorEndDay = value;
    });
  }

  final _$enableSavingAtom = Atom(name: '_EstimateControllerBase.enableSaving');

  @override
  bool get enableSaving {
    _$enableSavingAtom.reportRead();
    return super.enableSaving;
  }

  @override
  set enableSaving(bool value) {
    _$enableSavingAtom.reportWrite(value, super.enableSaving, () {
      super.enableSaving = value;
    });
  }

  final _$_EstimateControllerBaseActionController =
      ActionController(name: '_EstimateControllerBase');

  @override
  void setNewEstimate(EstimateStore value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setNewEstimate');
    try {
      return super.setNewEstimate(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorMonth(bool value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setErrorMonth');
    try {
      return super.setErrorMonth(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorStartDay(bool value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setErrorStartDay');
    try {
      return super.setErrorStartDay(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorEndDay(bool value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setErrorEndDay');
    try {
      return super.setErrorEndDay(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableSaving(bool value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setEnableSaving');
    try {
      return super.setEnableSaving(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedFixedExpenses: ${selectedFixedExpenses},
selectedVariedExpenses: ${selectedVariedExpenses},
newEstimate: ${newEstimate},
errorMonth: ${errorMonth},
errorStartDay: ${errorStartDay},
errorEndDay: ${errorEndDay},
enableSaving: ${enableSaving}
    ''';
  }
}
