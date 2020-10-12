// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lists_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ListsController = BindInject(
  (i) => ListsController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListsController on _ListsControllerBase, Store {
  final _$myListsAtom = Atom(name: '_ListsControllerBase.myLists');

  @override
  ObservableList<MyListStore> get myLists {
    _$myListsAtom.reportRead();
    return super.myLists;
  }

  @override
  set myLists(ObservableList<MyListStore> value) {
    _$myListsAtom.reportWrite(value, super.myLists, () {
      super.myLists = value;
    });
  }

  final _$_ListsControllerBaseActionController =
      ActionController(name: '_ListsControllerBase');

  @override
  List<MyListItemStore> getItemsList(int index) {
    final _$actionInfo = _$_ListsControllerBaseActionController.startAction(
        name: '_ListsControllerBase.getItemsList');
    try {
      return super.getItemsList(index);
    } finally {
      _$_ListsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  MyListStore getList(int id) {
    final _$actionInfo = _$_ListsControllerBaseActionController.startAction(
        name: '_ListsControllerBase.getList');
    try {
      return super.getList(id);
    } finally {
      _$_ListsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myLists: ${myLists}
    ''';
  }
}
