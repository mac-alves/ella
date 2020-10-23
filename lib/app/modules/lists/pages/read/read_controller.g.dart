// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ReadController = BindInject(
  (i) => ReadController(i<ListsController>(), i<ILocalStorage>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReadController on _ReadControllerBase, Store {
  final _$setCheckedAsyncAction = AsyncAction('_ReadControllerBase.setChecked');

  @override
  Future<dynamic> setChecked(MyListItemStore item, MyListStore list) {
    return _$setCheckedAsyncAction.run(() => super.setChecked(item, list));
  }

  final _$removeListAsyncAction = AsyncAction('_ReadControllerBase.removeList');

  @override
  Future<dynamic> removeList(MyListStore item) {
    return _$removeListAsyncAction.run(() => super.removeList(item));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
