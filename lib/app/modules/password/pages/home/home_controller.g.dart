// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<PasswordController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listPasswordToDeleteAtom =
      Atom(name: '_HomeControllerBase.listPasswordToDelete');

  @override
  ObservableList<int> get listPasswordToDelete {
    _$listPasswordToDeleteAtom.reportRead();
    return super.listPasswordToDelete;
  }

  @override
  set listPasswordToDelete(ObservableList<int> value) {
    _$listPasswordToDeleteAtom.reportWrite(value, super.listPasswordToDelete,
        () {
      super.listPasswordToDelete = value;
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

  final _$deletePasswordsSelectedsAsyncAction =
      AsyncAction('_HomeControllerBase.deletePasswordsSelecteds');

  @override
  Future<dynamic> deletePasswordsSelecteds() {
    return _$deletePasswordsSelectedsAsyncAction
        .run(() => super.deletePasswordsSelecteds());
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
listPasswordToDelete: ${listPasswordToDelete},
isDelete: ${isDelete}
    ''';
  }
}
