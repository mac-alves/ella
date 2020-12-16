import 'repositories/local_storage/hive/hive_repository.dart';
import 'services/local_storage_hive_service.dart';
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
        Bind((i) => EstimateController(i.get())),
        Bind((i) => SpentController(i.get())),
        Bind((i) => HomeController(i.get())),
        Bind((i) => ReadController(i.get())),
        Bind((i) => HiveRepository()),
        Bind((i) => LocalStorageHiveService(i.get())),
        $MoneyController,
      ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<MoneyModule>.of();
}
