// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CreateController = BindInject(
  (i) => CreateController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateController on _CreateControllerBase, Store {
  final _$shoppingItemsAtom = Atom(name: '_CreateControllerBase.shoppingItems');

  @override
  ObservableList<String> get shoppingItems {
    _$shoppingItemsAtom.reportRead();
    return super.shoppingItems;
  }

  @override
  set shoppingItems(ObservableList<String> value) {
    _$shoppingItemsAtom.reportWrite(value, super.shoppingItems, () {
      super.shoppingItems = value;
    });
  }

  final _$_CreateControllerBaseActionController =
      ActionController(name: '_CreateControllerBase');

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
  String toString() {
    return '''
shoppingItems: ${shoppingItems}
    ''';
  }
}
