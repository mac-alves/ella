// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_list_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MyListStore = BindInject(
  (i) => MyListStore(
      id: i<int>(),
      name: i<String>(),
      concluded: i<bool>(),
      selected: i<bool>(),
      items: i<List<MyListItemStore>>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyListStore on _MyListStoreBase, Store {
  final _$idAtom = Atom(name: '_MyListStoreBase.id');

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

  final _$nameAtom = Atom(name: '_MyListStoreBase.name');

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

  final _$concludedAtom = Atom(name: '_MyListStoreBase.concluded');

  @override
  bool get concluded {
    _$concludedAtom.reportRead();
    return super.concluded;
  }

  @override
  set concluded(bool value) {
    _$concludedAtom.reportWrite(value, super.concluded, () {
      super.concluded = value;
    });
  }

  final _$selectedAtom = Atom(name: '_MyListStoreBase.selected');

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

  final _$itemsAtom = Atom(name: '_MyListStoreBase.items');

  @override
  ObservableList<MyListItemStore> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<MyListItemStore> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_MyListStoreBaseActionController =
      ActionController(name: '_MyListStoreBase');

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_MyListStoreBaseActionController.startAction(
        name: '_MyListStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_MyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_MyListStoreBaseActionController.startAction(
        name: '_MyListStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_MyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setConcluded() {
    final _$actionInfo = _$_MyListStoreBaseActionController.startAction(
        name: '_MyListStoreBase.setConcluded');
    try {
      return super.setConcluded();
    } finally {
      _$_MyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelected(bool value) {
    final _$actionInfo = _$_MyListStoreBaseActionController.startAction(
        name: '_MyListStoreBase.setSelected');
    try {
      return super.setSelected(value);
    } finally {
      _$_MyListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
concluded: ${concluded},
selected: ${selected},
items: ${items}
    ''';
  }
}
