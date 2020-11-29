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
newEstimate: ${newEstimate},
errorMonth: ${errorMonth},
errorStartDay: ${errorStartDay},
errorEndDay: ${errorEndDay},
errorSavings: ${errorSavings},
isEdit: ${isEdit}
    ''';
  }
}
