// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<ListsController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listListsToDeleteAtom =
      Atom(name: '_HomeControllerBase.listListsToDelete');

  @override
  ObservableList<int> get listListsToDelete {
    _$listListsToDeleteAtom.reportRead();
    return super.listListsToDelete;
  }

  @override
  set listListsToDelete(ObservableList<int> value) {
    _$listListsToDeleteAtom.reportWrite(value, super.listListsToDelete, () {
      super.listListsToDelete = value;
    });
  }

  final _$isDeleteAtom = Atom(name: '_HomeControllerBase.isDelete');

  @override
  bool get isDelete {
    _$isDeleteAtom.reportRead();
    return super.isDelete;
  }

  @override
  set isDelete(bool value) {
    _$isDeleteAtom.reportWrite(value, super.isDelete, () {
      super.isDelete = value;
    });
  }

  final _$deleteListsSelectedsAsyncAction =
      AsyncAction('_HomeControllerBase.deleteListsSelecteds');

  @override
  Future<dynamic> deleteListsSelecteds() {
    return _$deleteListsSelectedsAsyncAction
        .run(() => super.deleteListsSelecteds());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setIsDelete(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsDelete');
    try {
      return super.setIsDelete(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectToDelete(int idPass) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.selectToDelete');
    try {
      return super.selectToDelete(idPass);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeToDelete(int idPass) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeToDelete');
    try {
      return super.removeToDelete(idPass);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listListsToDelete: ${listListsToDelete},
isDelete: ${isDelete}
    ''';
  }
}
