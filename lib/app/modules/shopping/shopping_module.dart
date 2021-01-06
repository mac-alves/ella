import 'models/shopping_item_store.dart';
import 'models/shopping_store.dart';
import 'pages/create/create_controller.dart';
import 'pages/home/home_controller.dart';
import 'shopping_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shopping_routes.dart';

class ShoppingModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ShoppingItemStore,
        $ShoppingStore,
        Bind((i) => CreateController(i.get())),
        Bind((i) => HomeController(i.get())),
        $ShoppingController,
      ];

  @override
  List<ModularRouter> get routers => routes;

  static Inject get to => Inject<ShoppingModule>.of();
}
