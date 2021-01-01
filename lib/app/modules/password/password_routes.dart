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
  ModularRouter(PASSWORD_CREATE, child: (_, args) => CreatePage()),
];