// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ShoppingStore = BindInject(
  (i) => ShoppingStore(
      id: i<int>(),
      title: i<String>(),
      amount: i<double>(),
      qtItems: i<int>(),
      selected: i<bool>(),
      items: i<List<ShoppingItemStore>>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingStore on _ShoppingStoreBase, Store {
  final _$idAtom = Atom(name: '_ShoppingStoreBase.id');

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

  final _$titleAtom = Atom(name: '_ShoppingStoreBase.title');

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

  final _$amountAtom = Atom(name: '_ShoppingStoreBase.amount');

  @override
  double get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$qtItemsAtom = Atom(name: '_ShoppingStoreBase.qtItems');

  @override
  int get qtItems {
    _$qtItemsAtom.reportRead();
    return super.qtItems;
  }

  @override
  set qtItems(int value) {
    _$qtItemsAtom.reportWrite(value, super.qtItems, () {
      super.qtItems = value;
    });
  }

  final _$selectedAtom = Atom(name: '_ShoppingStoreBase.selected');

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

  final _$itemsAtom = Atom(name: '_ShoppingStoreBase.items');

  @override
  ObservableList<ShoppingItemStore> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ShoppingItemStore> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_ShoppingStoreBaseActionController =
      ActionController(name: '_ShoppingStoreBase');

  @override
  dynamic setId(int value) {
    final _$actionInfo = _$_ShoppingStoreBaseActionController.startAction(
        name: '_ShoppingStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_ShoppingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_ShoppingStoreBaseActionController.startAction(
        name: '_ShoppingStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ShoppingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAmount(double value) {
    final _$actionInfo = _$_ShoppingStoreBaseActionController.startAction(
        name: '_ShoppingStoreBase.setAmount');
    try {
      return super.setAmount(value);
    } finally {
      _$_ShoppingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQtItems(int value) {
    final _$actionInfo = _$_ShoppingStoreBaseActionController.startAction(
        name: '_ShoppingStoreBase.setQtItems');
    try {
      return super.setQtItems(value);
    } finally {
      _$_ShoppingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSelected(bool value) {
    final _$actionInfo = _$_ShoppingStoreBaseActionController.startAction(
        name: '_ShoppingStoreBase.setSelected');
    try {
      return super.setSelected(value);
    } finally {
      _$_ShoppingStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
amount: ${amount},
qtItems: ${qtItems},
selected: ${selected},
items: ${items}
    ''';
  }
}
