import 'package:ella/app/modules/password/pages/create/create_page.dart';
import 'package:ella/app/modules/password/pages/home/home_page.dart';
import 'package:ella/app/modules/password/pages/login/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

const String LOGIN = "/";
const String HOME = "/home";
const String CREATE = "/create";

const String PASSWORD         = "/password";
const String PASSWORD_CREATE  = "$PASSWORD$CREATE";
const String PASSWORD_HOME    = "$PASSWORD$HOME";

var routes = [
  ModularRouter(LOGIN, child: (_, args) => LoginPage()),

  ModularRouter(PASSWORD_HOME, child: (_, args) => HomePage()),

  /// 
  /// Criação de senha
  /// 
  ModularRouter(PASSWORD_CREATE, child: (_, args) => CreatePage()),

  /// 
  /// Alteração de senha
  /// 
  /// :id -> id da senha
  /// 
  ModularRouter(
    "$PASSWORD_CREATE/:id",
    child: (_, args) => CreatePage(
      id: int.parse(args.params['id'])
    )
  ),
];