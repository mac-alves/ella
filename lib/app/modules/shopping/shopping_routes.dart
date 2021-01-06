import 'package:ella/app/modules/shopping/pages/create/create_page.dart';
import 'package:ella/app/modules/shopping/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

const String HOME = "/";
const String CREATE = "/create";

const String SHOPPING         = "/shopping";
const String SHOPPING_CREATE  = "$SHOPPING$CREATE";

var routes = [
  // ModularRouter(LOGIN, child: (_, args) => LoginPage()),

  ModularRouter(HOME, child: (_, args) => HomePage()),

  /// 
  /// Criação de senha
  /// 
  ModularRouter(SHOPPING_CREATE, child: (_, args) => CreatePage()),

  /// 
  /// Alteração de compra
  /// 
  /// :id -> id da senha
  /// 
  ModularRouter(
    "$SHOPPING_CREATE/:id",
    child: (_, args) => CreatePage(
      id: int.parse(args.params['id'])
    )
  ),
];