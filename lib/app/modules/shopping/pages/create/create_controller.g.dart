// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CreateController = BindInject(
  (i) => CreateController(i<ShoppingController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateController on _CreateControllerBase, Store {
  final _$newShoppingAtom = Atom(name: '_CreateControllerBase.newShopping');

  @override
  ShoppingStore get newShopping {
    _$newShoppingAtom.reportRead();
    return super.newShopping;
  }

  @override
  set newShopping(ShoppingStore value) {
    _$newShoppingAtom.reportWrite(value, super.newShopping, () {
      super.newShopping = value;
    });
  }

  final _$idNewShoppingAtom = Atom(name: '_CreateControllerBase.idNewShopping');

  @override
  int get idNewShopping {
    _$idNewShoppingAtom.reportRead();
    return super.idNewShopping;
  }

  @override
  set idNewShopping(int value) {
    _$idNewShoppingAtom.reportWrite(value, super.idNewShopping, () {
      super.idNewShopping = value;
    });
  }

  final _$erroTitleAtom = Atom(name: '_CreateControllerBase.erroTitle');

  @override
  bool get erroTitle {
    _$erroTitleAtom.reportRead();
    return super.erroTitle;
  }

  @override
  set erroTitle(bool value) {
    _$erroTitleAtom.reportWrite(value, super.erroTitle, () {
      super.erroTitle = value;
    });
  }

  final _$erroItemsAtom = Atom(name: '_CreateControllerBase.erroItems');

  @override
  bool get erroItems {
    _$erroItemsAtom.reportRead();
    return super.erroItems;
  }

  @override
  set erroItems(bool value) {
    _$erroItemsAtom.reportWrite(value, super.erroItems, () {
      super.erroItems = value;
    });
  }

  final _$msgErroItemsAtom = Atom(name: '_CreateControllerBase.msgErroItems');

  @override
  String get msgErroItems {
    _$msgErroItemsAtom.reportRead();
    return super.msgErroItems;
  }

  @override
  set msgErroItems(String value) {
    _$msgErroItemsAtom.reportWrite(value, super.msgErroItems, () {
      super.msgErroItems = value;
    });
  }

  final _$amountAtom = Atom(name: '_CreateControllerBase.amount');

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

  final _$qtItemsAtom = Atom(name: '_CreateControllerBase.qtItems');

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

  final _$createShoppingAsyncAction =
      AsyncAction('_CreateControllerBase.createShopping');

  @override
  Future<dynamic> createShopping(ShoppingStore shopp) {
    return _$createShoppingAsyncAction.run(() => super.createShopping(shopp));
  }

  final _$updateShoppingAsyncAction =
      AsyncAction('_CreateControllerBase.updateShopping');

  @override
  Future<dynamic> updateShopping(ShoppingStore shopp) {
    return _$updateShoppingAsyncAction.run(() => super.updateShopping(shopp));
  }

  final _$_CreateControllerBaseActionController =
      ActionController(name: '_CreateControllerBase');

  @override
  void setNewShopping(ShoppingStore value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setNewShopping');
    try {
      return super.setNewShopping(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdNewShopping(int value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setIdNewShopping');
    try {
      return super.setIdNewShopping(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroTitle(bool value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setErroTitle');
    try {
      return super.setErroTitle(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroItems(bool value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setErroItems');
    try {
      return super.setErroItems(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMsgErroItems(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setMsgErroItems');
    try {
      return super.setMsgErroItems(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addItem() {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.addItem');
    try {
      return super.addItem();
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount() {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setAmount');
    try {
      return super.setAmount();
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newShopping: ${newShopping},
idNewShopping: ${idNewShopping},
erroTitle: ${erroTitle},
erroItems: ${erroItems},
msgErroItems: ${msgErroItems},
amount: ${amount},
qtItems: ${qtItems}
    ''';
  }
}
