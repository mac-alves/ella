// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PasswordController = BindInject(
  (i) => PasswordController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordController on _PasswordControllerBase, Store {
  final _$passwordsAtom = Atom(name: '_PasswordControllerBase.passwords');

  @override
  ObservableList<PasswordStore> get passwords {
    _$passwordsAtom.reportRead();
    return super.passwords;
  }

  @override
  set passwords(ObservableList<PasswordStore> value) {
    _$passwordsAtom.reportWrite(value, super.passwords, () {
      super.passwords = value;
    });
  }

  final _$passwordLoginAtom =
      Atom(name: '_PasswordControllerBase.passwordLogin');

  @override
  String get passwordLogin {
    _$passwordLoginAtom.reportRead();
    return super.passwordLogin;
  }

  @override
  set passwordLogin(String value) {
    _$passwordLoginAtom.reportWrite(value, super.passwordLogin, () {
      super.passwordLogin = value;
    });
  }

  final _$_PasswordControllerBaseActionController =
      ActionController(name: '_PasswordControllerBase');

  @override
  void setPasswordLogin(String value) {
    final _$actionInfo = _$_PasswordControllerBaseActionController.startAction(
        name: '_PasswordControllerBase.setPasswordLogin');
    try {
      return super.setPasswordLogin(value);
    } finally {
      _$_PasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  PasswordStore getPassword(int id) {
    final _$actionInfo = _$_PasswordControllerBaseActionController.startAction(
        name: '_PasswordControllerBase.getPassword');
    try {
      return super.getPassword(id);
    } finally {
      _$_PasswordControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
passwords: ${passwords},
passwordLogin: ${passwordLogin}
    ''';
  }
}
