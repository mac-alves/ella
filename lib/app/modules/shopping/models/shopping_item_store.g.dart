// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ShoppingItemStore = BindInject(
  (i) => ShoppingItemStore(
      id: i<int>(),
      qt: i<String>(),
      name: i<String>(),
      value: i<String>(),
      error: i<String>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingItemStore on _ShoppingItemStoreBase, Store {
  final _$idAtom = Atom(name: '_ShoppingItemStoreBase.id');

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

  final _$qtAtom = Atom(name: '_ShoppingItemStoreBase.qt');

  @override
  String get qt {
    _$qtAtom.reportRead();
    return super.qt;
  }

  @override
  set qt(String value) {
    _$qtAtom.reportWrite(value, super.qt, () {
      super.qt = value;
    });
  }

  final _$nameAtom = Atom(name: '_ShoppingItemStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$valueAtom = Atom(name: '_ShoppingItemStoreBase.value');

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

  final _$errorAtom = Atom(name: '_ShoppingItemStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_ShoppingItemStoreBaseActionController =
      ActionController(name: '_ShoppingItemStoreBase');

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_ShoppingItemStoreBaseActionController.startAction(
        name: '_ShoppingItemStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ShoppingItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQt(String value) {
    final _$actionInfo = _$_ShoppingItemStoreBaseActionController.startAction(
        name: '_ShoppingItemStoreBase.setQt');
    try {
      return super.setQt(value);
    } finally {
      _$_ShoppingItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_ShoppingItemStoreBaseActionController.startAction(
        name: '_ShoppingItemStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ShoppingItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setValue(String newValue) {
    final _$actionInfo = _$_ShoppingItemStoreBaseActionController.startAction(
        name: '_ShoppingItemStoreBase.setValue');
    try {
      return super.setValue(newValue);
    } finally {
      _$_ShoppingItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setError(String value) {
    final _$actionInfo = _$_ShoppingItemStoreBaseActionController.startAction(
        name: '_ShoppingItemStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_ShoppingItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
qt: ${qt},
name: ${name},
value: ${value},
error: ${error}
    ''';
  }
}
