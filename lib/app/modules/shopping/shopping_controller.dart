import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/shopping_store.dart';

part 'shopping_controller.g.dart';

@Injectable()
class ShoppingController = _ShoppingControllerBase with _$ShoppingController;

abstract class _ShoppingControllerBase with Store {
  
  @observable
  ObservableList<ShoppingStore> shoppings = <ShoppingStore>[].asObservable();

  _ShoppingControllerBase();

  @action
  ShoppingStore getShopping(int id){
    return shoppings.firstWhere(
      (element) => element.id == id,
      orElse: () => null
    );
  }
}
