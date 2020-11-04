import 'pages/create/spent/spent_controller.dart';
import 'pages/create/estimate/estimate_controller.dart';
import 'models/expense_store.dart';
import 'models/spent_store.dart';
import 'models/estimate_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'money_routes.dart';
import 'pages/read/read_controller.dart';
import 'pages/home/home_controller.dart';
import 'money_controller.dart';

class MoneyModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ExpenseStore,
        $SpentStore,
        $EstimateStore,
        Bind((i) => EstimateController()),
        Bind((i) => SpentController()),
        Bind((i) => HomeController()),
        Bind((i) => ReadController(i.get())),
        $MoneyController,
      ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<MoneyModule>.of();
}
