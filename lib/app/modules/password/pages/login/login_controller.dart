import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  
  @observable
  String password;

  @observable
  String msgErroPassword = 'Senha não confere';

  @observable
  bool erroPassword = false;

  @action
  void setPassword(String value) => password = value;

  @action
  void setMsgErroPassword(String value) => msgErroPassword = value;

  @action
  void setErroPassword(bool value) => erroPassword = value;
}
