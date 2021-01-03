// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PasswordStore = BindInject(
  (i) => PasswordStore(
      id: i<int>(),
      title: i<String>(),
      password: i<String>(),
      selected: i<bool>(),
      visible: i<bool>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordStore on _PasswordStoreBase, Store {
  final _$idAtom = Atom(name: '_PasswordStoreBase.id');

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

  final _$titleAtom = Atom(name: '_PasswordStoreBase.title');

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

  final _$passwordAtom = Atom(name: '_PasswordStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$selectedAtom = Atom(name: '_PasswordStoreBase.selected');

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

  final _$visibleAtom = Atom(name: '_PasswordStoreBase.visible');

  @override
  bool get visible {
    _$visibleAtom.reportRead();
    return super.visible;
  }

  @override
  set visible(bool value) {
    _$visibleAtom.reportWrite(value, super.visible, () {
      super.visible = value;
    });
  }

  final _$_PasswordStoreBaseActionController =
      ActionController(name: '_PasswordStoreBase');

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelected(bool value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setSelected');
    try {
      return super.setSelected(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setVisible(bool value) {
    final _$actionInfo = _$_PasswordStoreBaseActionController.startAction(
        name: '_PasswordStoreBase.setVisible');
    try {
      return super.setVisible(value);
    } finally {
      _$_PasswordStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
password: ${password},
selected: ${selected},
visible: ${visible}
    ''';
  }
}
