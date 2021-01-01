// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$passwordAtom = Atom(name: '_LoginControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$msgErroPasswordAtom =
      Atom(name: '_LoginControllerBase.msgErroPassword');

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

  final _$erroPasswordAtom = Atom(name: '_LoginControllerBase.erroPassword');

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

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMsgErroPassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setMsgErroPassword');
    try {
      return super.setMsgErroPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setErroPassword(bool value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setErroPassword');
    try {
      return super.setErroPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password},
msgErroPassword: ${msgErroPassword},
erroPassword: ${erroPassword}
    ''';
  }
}
