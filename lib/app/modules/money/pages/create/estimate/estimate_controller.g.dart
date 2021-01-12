// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EstimateController = BindInject(
  (i) => EstimateController(i<MoneyController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EstimateController on _EstimateControllerBase, Store {
  final _$fixedExpensesOfEstimateAtom =
      Atom(name: '_EstimateControllerBase.fixedExpensesOfEstimate');

  @override
  ObservableList<SpentStore> get fixedExpensesOfEstimate {
    _$fixedExpensesOfEstimateAtom.reportRead();
    return super.fixedExpensesOfEstimate;
  }

  @override
  set fixedExpensesOfEstimate(ObservableList<SpentStore> value) {
    _$fixedExpensesOfEstimateAtom
        .reportWrite(value, super.fixedExpensesOfEstimate, () {
      super.fixedExpensesOfEstimate = value;
    });
  }

  final _$fixedGeneralExpensesAtom =
      Atom(name: '_EstimateControllerBase.fixedGeneralExpenses');

  @override
  ObservableList<SpentStore> get fixedGeneralExpenses {
    _$fixedGeneralExpensesAtom.reportRead();
    return super.fixedGeneralExpenses;
  }

  @override
  set fixedGeneralExpenses(ObservableList<SpentStore> value) {
    _$fixedGeneralExpensesAtom.reportWrite(value, super.fixedGeneralExpenses,
        () {
      super.fixedGeneralExpenses = value;
    });
  }

  final _$expectedExpensesAtom =
      Atom(name: '_EstimateControllerBase.expectedExpenses');

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

  final _$variedExpensesAtom =
      Atom(name: '_EstimateControllerBase.variedExpenses');

  @override
  ObservableList<SpentStore> get variedExpenses {
    _$variedExpensesAtom.reportRead();
    return super.variedExpenses;
  }

  @override
  set variedExpenses(ObservableList<SpentStore> value) {
    _$variedExpensesAtom.reportWrite(value, super.variedExpenses, () {
      super.variedExpenses = value;
    });
  }

  final _$currentStateExpenseAtom =
      Atom(name: '_EstimateControllerBase.currentStateExpense');

  @override
  States get currentStateExpense {
    _$currentStateExpenseAtom.reportRead();
    return super.currentStateExpense;
  }

  @override
  set currentStateExpense(States value) {
    _$currentStateExpenseAtom.reportWrite(value, super.currentStateExpense, () {
      super.currentStateExpense = value;
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

  final _$idNewEstimateAtom =
      Atom(name: '_EstimateControllerBase.idNewEstimate');

  @override
  int get idNewEstimate {
    _$idNewEstimateAtom.reportRead();
    return super.idNewEstimate;
  }

  @override
  set idNewEstimate(int value) {
    _$idNewEstimateAtom.reportWrite(value, super.idNewEstimate, () {
      super.idNewEstimate = value;
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

  final _$errorSavingsAtom = Atom(name: '_EstimateControllerBase.errorSavings');

  @override
  bool get errorSavings {
    _$errorSavingsAtom.reportRead();
    return super.errorSavings;
  }

  @override
  set errorSavings(bool value) {
    _$errorSavingsAtom.reportWrite(value, super.errorSavings, () {
      super.errorSavings = value;
    });
  }

  final _$isEditAtom = Atom(name: '_EstimateControllerBase.isEdit');

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  final _$_EstimateControllerBaseActionController =
      ActionController(name: '_EstimateControllerBase');

  @override
  void setCurrentStateExpense(States value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setCurrentStateExpense');
    try {
      return super.setCurrentStateExpense(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setIdNewEstimate(int value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setIdNewEstimate');
    try {
      return super.setIdNewEstimate(value);
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
  void setErrorSavings(bool value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setErrorSavings');
    try {
      return super.setErrorSavings(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEdit(bool value) {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.setIsEdit');
    try {
      return super.setIsEdit(value);
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createEstimate() {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.createEstimate');
    try {
      return super.createEstimate();
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateEstimate() {
    final _$actionInfo = _$_EstimateControllerBaseActionController.startAction(
        name: '_EstimateControllerBase.updateEstimate');
    try {
      return super.updateEstimate();
    } finally {
      _$_EstimateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fixedExpensesOfEstimate: ${fixedExpensesOfEstimate},
fixedGeneralExpenses: ${fixedGeneralExpenses},
expectedExpenses: ${expectedExpenses},
variedExpenses: ${variedExpenses},
currentStateExpense: ${currentStateExpense},
newEstimate: ${newEstimate},
idNewEstimate: ${idNewEstimate},
errorMonth: ${errorMonth},
errorStartDay: ${errorStartDay},
errorEndDay: ${errorEndDay},
errorSavings: ${errorSavings},
isEdit: ${isEdit}
    ''';
  }
}
