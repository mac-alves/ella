import 'package:ella/app/modules/lists/repositories/local_storage/hive/hive_repository.dart';
import 'services/local_storage_hive_service.dart';
import 'models/my_list_item_store.dart';
import 'models/my_list_store.dart';
import 'lists_routes.dart';
import 'pages/read/read_controller.dart';
import 'pages/create/create_controller.dart';
import 'pages/home/home_controller.dart';
import 'lists_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MyListItemStore,
        $MyListStore,
        Bind((i) => ReadController(i.get(), i.get())),
        Bind((i) => CreateController(i.get())),
        Bind((i) => HomeController(i.get())),
        Bind((i) => HiveRepository()),
        Bind((i) => LocalStorageHiveService(i.get())),
        $ListsController,
      ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<ListsModule>.of();
}
