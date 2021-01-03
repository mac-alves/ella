// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CreateController = BindInject(
  (i) => CreateController(i<PasswordController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateController on _CreateControllerBase, Store {
  final _$newPasswordAtom = Atom(name: '_CreateControllerBase.newPassword');

  @override
  PasswordStore get newPassword {
    _$newPasswordAtom.reportRead();
    return super.newPassword;
  }

  @override
  set newPassword(PasswordStore value) {
    _$newPasswordAtom.reportWrite(value, super.newPassword, () {
      super.newPassword = value;
    });
  }

  final _$idNewPasswordAtom = Atom(name: '_CreateControllerBase.idNewPassword');

  @override
  int get idNewPassword {
    _$idNewPasswordAtom.reportRead();
    return super.idNewPassword;
  }

  @override
  set idNewPassword(int value) {
    _$idNewPasswordAtom.reportWrite(value, super.idNewPassword, () {
      super.idNewPassword = value;
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

  final _$erroPasswordAtom = Atom(name: '_CreateControllerBase.erroPassword');

  @override
  bool get erroPassword {
    _$erroPasswordAtom.reportRead();
    return super.erroPassword;
  }

  @override
  set erroPassword(bool value) {
    _$erroPasswordAtom.reportWrite(value, super.erroPassword, () {
      super.erroPassword = value;
    });
  }

  final _$msgErroTitleAtom = Atom(name: '_CreateControllerBase.msgErroTitle');

  @override
  String get msgErroTitle {
    _$msgErroTitleAtom.reportRead();
    return super.msgErroTitle;
  }

  @override
  set msgErroTitle(String value) {
    _$msgErroTitleAtom.reportWrite(value, super.msgErroTitle, () {
      super.msgErroTitle = value;
    });
  }

  final _$msgErroPasswordAtom =
      Atom(name: '_CreateControllerBase.msgErroPassword');

  @override
  String get msgErroPassword {
    _$msgErroPasswordAtom.reportRead();
    return super.msgErroPassword;
  }

  @override
  set msgErroPassword(String value) {
    _$msgErroPasswordAtom.reportWrite(value, super.msgErroPassword, () {
      super.msgErroPassword = value;
    });
  }

  final _$isEditAtom = Atom(name: '_CreateControllerBase.isEdit');

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  final _$createPasswordAsyncAction =
      AsyncAction('_CreateControllerBase.createPassword');

  @override
  Future<dynamic> createPassword(PasswordStore pass) {
    return _$createPasswordAsyncAction.run(() => super.createPassword(pass));
  }

  final _$updatePasswordAsyncAction =
      AsyncAction('_CreateControllerBase.updatePassword');

  @override
  Future<dynamic> updatePassword(PasswordStore pass) {
    return _$updatePasswordAsyncAction.run(() => super.updatePassword(pass));
  }

  final _$_CreateControllerBaseActionController =
      ActionController(name: '_CreateControllerBase');

  @override
  void setNewPassword(PasswordStore value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIdNewPassword(int value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setIdNewPassword');
    try {
      return super.setIdNewPassword(value);
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
  void setErroPassword(bool value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setErroPassword');
    try {
      return super.setErroPassword(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMsgErroTitle(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setMsgErroTitle');
    try {
      return super.setMsgErroTitle(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMsgErroPassword(String value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setMsgErroPassword');
    try {
      return super.setMsgErroPassword(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEdit(bool value) {
    final _$actionInfo = _$_CreateControllerBaseActionController.startAction(
        name: '_CreateControllerBase.setIsEdit');
    try {
      return super.setIsEdit(value);
    } finally {
      _$_CreateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newPassword: ${newPassword},
idNewPassword: ${idNewPassword},
erroTitle: ${erroTitle},
erroPassword: ${erroPassword},
msgErroTitle: ${msgErroTitle},
msgErroPassword: ${msgErroPassword},
isEdit: ${isEdit}
    ''';
  }
}
