// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReadController = BindInject(
  (i) => ReadController(i<ListsController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadController on _ReadControllerBase, Store {
  final _$_ReadControllerBaseActionController =
      ActionController(name: '_ReadControllerBase');

  @override
  void setChecked(MyListItemStore item, MyListStore list) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.setChecked');
    try {
      return super.setChecked(item, list);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeList(MyListStore item) {
    final _$actionInfo = _$_ReadControllerBaseActionController.startAction(
        name: '_ReadControllerBase.removeList');
    try {
      return super.removeList(item);
    } finally {
      _$_ReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
