// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReadController = BindInject(
  (i) => ReadController(i<MoneyController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadController on _ReadControllerBase, Store {
  final _$currentStateAtom = Atom(name: '_ReadControllerBase.currentState');

  @override
  States get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(States value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  final _$spentsAtom = Atom(name: '_ReadControllerBase.spents');

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

  final _$titleAtom = Atom(name: '_ReadControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$isDeleteAtom = Atom(name: '_ReadControllerBase.isDelete');

  @override
  bool get isDelete {
    _$isDeleteAtom.reportRead();
    return super.isDelete;
  }

  @override
  set isDelete(bool value) {
    _$isDeleteAtom.reportWrite(value, super.isDelete, () {
      super.isDelete = value;
    });
  }

  final _$listSpentToDeleteAtom =
      Atom(name: '_ReadControllerBase.listSpentToDelete');

  @override
  ObservableList<String> get listSpentToDelete {
    _$listSpentToDeleteAtom.reportRead();
    return super.listSpentToDelete;
  }

  @override
  set listSpentToDelete(ObservableList<String> value) {
    _$listSpentToDeleteAtom.reportWrite(value, super.listSpentToDelete, () {
      super.listSpentToDelete = value;
    });
  }

  final _$_ReadControllerBaseActionController =
      ActionController(name: '_ReadControllerBase');

  @override
  void setCurrentState(States value) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.setCurrentState');
    try {
      return super.setCurrentState(value);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsDelete(bool value) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.setIsDelete');
    try {
      return super.setIsDelete(value);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String type) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.setTitle');
    try {
      return super.setTitle(type);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpents(
      int id, String type, bool isFixedGeneral, bool isExpectedGeneral) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.setSpents');
    try {
      return super.setSpents(id, type, isFixedGeneral, isExpectedGeneral);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectToDelete(String idSpent) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.selectToDelete');
    try {
      return super.selectToDelete(idSpent);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeToDelete(String idSpent) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.removeToDelete');
    try {
      return super.removeToDelete(idSpent);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
spents: ${spents},
title: ${title},
isDelete: ${isDelete},
listSpentToDelete: ${listSpentToDelete}
    ''';
  }
}
