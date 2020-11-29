// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spent_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SpentStore = BindInject(
  (i) => SpentStore(
      id: i<String>(),
      title: i<String>(),
      value: i<String>(),
      date: i<String>(),
      selected: i<bool>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SpentStore on _SpentStoreBase, Store {
  final _$idAtom = Atom(name: '_SpentStoreBase.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_SpentStoreBase.title');

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

  final _$valueAtom = Atom(name: '_SpentStoreBase.value');

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$dateAtom = Atom(name: '_SpentStoreBase.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$selectedAtom = Atom(name: '_SpentStoreBase.selected');

  @override
  bool get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(bool value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  final _$_SpentStoreBaseActionController =
      ActionController(name: '_SpentStoreBase');

  @override
  dynamic setId(String value) {
    final _$actionInfo = _$_SpentStoreBaseActionController.startAction(
        name: '_SpentStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_SpentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_SpentStoreBaseActionController.startAction(
        name: '_SpentStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_SpentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(String newValue) {
    final _$actionInfo = _$_SpentStoreBaseActionController.startAction(
        name: '_SpentStoreBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$_SpentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDate(String value) {
    final _$actionInfo = _$_SpentStoreBaseActionController.startAction(
        name: '_SpentStoreBase.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_SpentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelected(bool value) {
    final _$actionInfo = _$_SpentStoreBaseActionController.startAction(
        name: '_SpentStoreBase.setSelected');
    try {
      return super.setSelected(value);
    } finally {
      _$_SpentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
value: ${value},
date: ${date},
selected: ${selected}
    ''';
  }
}
