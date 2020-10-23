// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CreateController = BindInject(
  (i) => CreateController(i<ListsController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateController on _CreateControllerBase, Store {
  Computed<bool> _$listIsValidComputed;

  @override
  bool get listIsValid =>
      (_$listIsValidComputed ??= Computed<bool>(() => super.listIsValid,
              name: '_CreateControllerBase.listIsValid'))
          .value;

  final _$newMyListAtom = Atom(name: '_CreateControllerBase.newMyList');

  @override
  MyListStore get newMyList {
    _$newMyListAtom.reportRead();
    return super.newMyList;
  }

  @override
  set newMyList(MyListStore value) {
    _$newMyListAtom.reportWrite(value, super.newMyList, () {
      super.newMyList = value;
    });
  }

  final _$isValidateAtom = Atom(name: '_CreateControllerBase.isValidate');

  @override
  bool get isValidate {
    _$isValidateAtom.reportRead();
    return super.isValidate;
  }

  @override
  set isValidate(bool value) {
    _$isValidateAtom.reportWrite(value, super.isValidate, () {
      super.isValidate = value;
    });
  }

  final _$idNewListAtom = Atom(name: '_CreateControllerBase.idNewList');

  @override
  int get idNewList {
    _$idNewListAtom.reportRead();
    return super.idNewList;
  }

  @override
  set idNewList(int value) {
    _$idNewListAtom.reportWrite(value, super.idNewList, () {
      super.idNewList = value;
    });
  }

  final _$addListAsyncAction = AsyncAction('_CreateControllerBase.addList');

  @override
  Future<dynamic> addList(MyListStore list) {
    return _$addListAsyncAction.run(() => super.addList(list));
  }

  final _$updateListAsyncAction =
      AsyncAction('_CreateControllerBase.updateList');

  @override
  Future<dynamic> updateList(MyListStore list) {
    return _$updateListAsyncAction.run(() => super.updateList(list));
  }

  final _$_CreateControllerBaseActionController =
      ActionController(name: '_CreateControllerBase');

  @override
  void setNewMyList(MyListStore value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setNewMyList');
    try {
      return super.setNewMyList(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdNewList(int value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setIdNewList');
    try {
      return super.setIdNewList(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVali(bool value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setVali');
    try {
      return super.setVali(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addListItem(MyListStore list) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.addListItem');
    try {
      return super.addListItem(list);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeListItem(MyListStore list, MyListItemStore item) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.removeListItem');
    try {
      return super.removeListItem(list, item);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newMyList: ${newMyList},
isValidate: ${isValidate},
idNewList: ${idNewList},
listIsValid: ${listIsValid}
    ''';
  }
}
