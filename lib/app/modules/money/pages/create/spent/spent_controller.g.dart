// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spent_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SpentController = BindInject(
  (i) => SpentController(i<MoneyController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpentController on _SpentControllerBase, Store {
  final _$newSpentAtom = Atom(name: '_SpentControllerBase.newSpent');

  @override
  SpentStore get newSpent {
    _$newSpentAtom.reportRead();
    return super.newSpent;
  }

  @override
  set newSpent(SpentStore value) {
    _$newSpentAtom.reportWrite(value, super.newSpent, () {
      super.newSpent = value;
    });
  }

  final _$typeAtom = Atom(name: '_SpentControllerBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$idEstimateAtom = Atom(name: '_SpentControllerBase.idEstimate');

  @override
  String get idEstimate {
    _$idEstimateAtom.reportRead();
    return super.idEstimate;
  }

  @override
  set idEstimate(String value) {
    _$idEstimateAtom.reportWrite(value, super.idEstimate, () {
      super.idEstimate = value;
    });
  }

  final _$errorTypeAtom = Atom(name: '_SpentControllerBase.errorType');

  @override
  bool get errorType {
    _$errorTypeAtom.reportRead();
    return super.errorType;
  }

  @override
  set errorType(bool value) {
    _$errorTypeAtom.reportWrite(value, super.errorType, () {
      super.errorType = value;
    });
  }

  final _$errorEstimateAtom = Atom(name: '_SpentControllerBase.errorEstimate');

  @override
  bool get errorEstimate {
    _$errorEstimateAtom.reportRead();
    return super.errorEstimate;
  }

  @override
  set errorEstimate(bool value) {
    _$errorEstimateAtom.reportWrite(value, super.errorEstimate, () {
      super.errorEstimate = value;
    });
  }

  final _$erroNameAtom = Atom(name: '_SpentControllerBase.erroName');

  @override
  bool get erroName {
    _$erroNameAtom.reportRead();
    return super.erroName;
  }

  @override
  set erroName(bool value) {
    _$erroNameAtom.reportWrite(value, super.erroName, () {
      super.erroName = value;
    });
  }

  final _$erroValueAtom = Atom(name: '_SpentControllerBase.erroValue');

  @override
  bool get erroValue {
    _$erroValueAtom.reportRead();
    return super.erroValue;
  }

  @override
  set erroValue(bool value) {
    _$erroValueAtom.reportWrite(value, super.erroValue, () {
      super.erroValue = value;
    });
  }

  final _$errorDateAtom = Atom(name: '_SpentControllerBase.errorDate');

  @override
  bool get errorDate {
    _$errorDateAtom.reportRead();
    return super.errorDate;
  }

  @override
  set errorDate(bool value) {
    _$errorDateAtom.reportWrite(value, super.errorDate, () {
      super.errorDate = value;
    });
  }

  final _$enableDateAtom = Atom(name: '_SpentControllerBase.enableDate');

  @override
  bool get enableDate {
    _$enableDateAtom.reportRead();
    return super.enableDate;
  }

  @override
  set enableDate(bool value) {
    _$enableDateAtom.reportWrite(value, super.enableDate, () {
      super.enableDate = value;
    });
  }

  final _$enableValueAtom = Atom(name: '_SpentControllerBase.enableValue');

  @override
  bool get enableValue {
    _$enableValueAtom.reportRead();
    return super.enableValue;
  }

  @override
  set enableValue(bool value) {
    _$enableValueAtom.reportWrite(value, super.enableValue, () {
      super.enableValue = value;
    });
  }

  final _$enableIdEstimateAtom =
      Atom(name: '_SpentControllerBase.enableIdEstimate');

  @override
  bool get enableIdEstimate {
    _$enableIdEstimateAtom.reportRead();
    return super.enableIdEstimate;
  }

  @override
  set enableIdEstimate(bool value) {
    _$enableIdEstimateAtom.reportWrite(value, super.enableIdEstimate, () {
      super.enableIdEstimate = value;
    });
  }

  final _$isEditAtom = Atom(name: '_SpentControllerBase.isEdit');

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

  final _$isSpentExpectedAtom =
      Atom(name: '_SpentControllerBase.isSpentExpected');

  @override
  bool get isSpentExpected {
    _$isSpentExpectedAtom.reportRead();
    return super.isSpentExpected;
  }

  @override
  set isSpentExpected(bool value) {
    _$isSpentExpectedAtom.reportWrite(value, super.isSpentExpected, () {
      super.isSpentExpected = value;
    });
  }

  final _$enableExpectedGeneralAtom =
      Atom(name: '_SpentControllerBase.enableExpectedGeneral');

  @override
  bool get enableExpectedGeneral {
    _$enableExpectedGeneralAtom.reportRead();
    return super.enableExpectedGeneral;
  }

  @override
  set enableExpectedGeneral(bool value) {
    _$enableExpectedGeneralAtom.reportWrite(value, super.enableExpectedGeneral,
        () {
      super.enableExpectedGeneral = value;
    });
  }

  final _$msgErroNameAtom = Atom(name: '_SpentControllerBase.msgErroName');

  @override
  String get msgErroName {
    _$msgErroNameAtom.reportRead();
    return super.msgErroName;
  }

  @override
  set msgErroName(String value) {
    _$msgErroNameAtom.reportWrite(value, super.msgErroName, () {
      super.msgErroName = value;
    });
  }

  final _$_SpentControllerBaseActionController =
      ActionController(name: '_SpentControllerBase');

  @override
  void setNewSpent(SpentStore value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setNewSpent');
    try {
      return super.setNewSpent(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdEstimate(String value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setIdEstimate');
    try {
      return super.setIdEstimate(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorType(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setErrorType');
    try {
      return super.setErrorType(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorEstimate(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setErrorEstimate');
    try {
      return super.setErrorEstimate(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroName(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setErroName');
    try {
      return super.setErroName(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroValue(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setErroValue');
    try {
      return super.setErroValue(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErrorDate(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setErrorDate');
    try {
      return super.setErrorDate(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableDate(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setEnableDate');
    try {
      return super.setEnableDate(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableValue(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setEnableValue');
    try {
      return super.setEnableValue(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableIdEstimate(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setEnableIdEstimate');
    try {
      return super.setEnableIdEstimate(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEdit(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setIsEdit');
    try {
      return super.setIsEdit(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsSpentExpected(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setIsSpentExpected');
    try {
      return super.setIsSpentExpected(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setType(String value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEnableExpectedGeneral(bool value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setEnableExpectedGeneral');
    try {
      return super.setEnableExpectedGeneral(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMsgErroName(String value) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.setMsgErroName');
    try {
      return super.setMsgErroName(value);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createSpent() {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.createSpent');
    try {
      return super.createSpent();
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateEstimate(String typeExpense, String idSpent) {
    final _$actionInfo = _$_SpentControllerBaseActionController.startAction(
        name: '_SpentControllerBase.updateEstimate');
    try {
      return super.updateEstimate(typeExpense, idSpent);
    } finally {
      _$_SpentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newSpent: ${newSpent},
type: ${type},
idEstimate: ${idEstimate},
errorType: ${errorType},
errorEstimate: ${errorEstimate},
erroName: ${erroName},
erroValue: ${erroValue},
errorDate: ${errorDate},
enableDate: ${enableDate},
enableValue: ${enableValue},
enableIdEstimate: ${enableIdEstimate},
isEdit: ${isEdit},
isSpentExpected: ${isSpentExpected},
enableExpectedGeneral: ${enableExpectedGeneral},
msgErroName: ${msgErroName}
    ''';
  }
}
