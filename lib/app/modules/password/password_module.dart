import 'services/local_storage_hive_service.dart';
import 'repositories/local_storage/hive/hive_repository.dart';
import 'models/password_store.dart';
import 'package:ella/app/modules/password/password_routes.dart';

import 'pages/home/home_controller.dart';
import 'pages/login/login_controller.dart';
import 'pages/create/create_controller.dart';
import 'password_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PasswordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PasswordStore,
        $LoginController,
        Bind((i) => HomeController(i.get())),
        Bind((i) => CreateController(i.get())),
        Bind((i) => HiveRepository()),
        Bind((i) => LocalStorageHiveService(i.get())),
        $PasswordController,
      ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<PasswordModule>.of();
}
