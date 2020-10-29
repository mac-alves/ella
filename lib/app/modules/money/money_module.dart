import 'package:ella/app/modules/money/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'money_routes.dart';
import 'pages/create/create_controller.dart';
import 'pages/read/read_controller.dart';
import 'pages/home/home_controller.dart';
import 'money_controller.dart';

class MoneyModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => ReadController(i.get())),
    Bind((i) => CreateController(i.get())),
    Bind((i) => HomeController(i.get())),
    $MoneyController,
  ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<MoneyModule>.of();
}
