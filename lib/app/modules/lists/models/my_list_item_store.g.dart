// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_item_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MyListItemStore = BindInject(
  (i) => MyListItemStore(id: i<int>(), name: i<String>(), checked: i<bool>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyListItemStore on _MyListItemStoreBase, Store {
  final _$idAtom = Atom(name: '_MyListItemStoreBase.id');

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

  final _$nameAtom = Atom(name: '_MyListItemStoreBase.name');

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

  final _$checkedAtom = Atom(name: '_MyListItemStoreBase.checked');

  @override
  bool get checked {
    _$checkedAtom.reportRead();
    return super.checked;
  }

  @override
  set checked(bool value) {
    _$checkedAtom.reportWrite(value, super.checked, () {
      super.checked = value;
    });
  }

  final _$_MyListItemStoreBaseActionController =
      ActionController(name: '_MyListItemStoreBase');

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_MyListItemStoreBaseActionController.startAction(
        name: '_MyListItemStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_MyListItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_MyListItemStoreBaseActionController.startAction(
        name: '_MyListItemStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_MyListItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChecked() {
    final _$actionInfo = _$_MyListItemStoreBaseActionController.startAction(
        name: '_MyListItemStoreBase.setChecked');
    try {
      return super.setChecked();
    } finally {
      _$_MyListItemStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
checked: ${checked}
    ''';
  }
}
