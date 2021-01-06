// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ShoppingController = BindInject(
  (i) => ShoppingController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingController on _ShoppingControllerBase, Store {
  final _$shoppingsAtom = Atom(name: '_ShoppingControllerBase.shoppings');

  @override
  ObservableList<ShoppingStore> get shoppings {
    _$shoppingsAtom.reportRead();
    return super.shoppings;
  }

  @override
  set shoppings(ObservableList<ShoppingStore> value) {
    _$shoppingsAtom.reportWrite(value, super.shoppings, () {
      super.shoppings = value;
    });
  }

  final _$_ShoppingControllerBaseActionController =
      ActionController(name: '_ShoppingControllerBase');

  @override
  ShoppingStore getShopping(int id) {
    final _$actionInfo = _$_ShoppingControllerBaseActionController.startAction(
        name: '_ShoppingControllerBase.getShopping');
    try {
      return super.getShopping(id);
    } finally {
      _$_ShoppingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shoppings: ${shoppings}
    ''';
  }
}
