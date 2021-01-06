import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shopping_controller.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final ShoppingController shopping;

  _HomeControllerBase(this.shopping);

  @observable
  ObservableList<int> listShoppingToDelete = <int>[].asObservable();

  @observable
  bool isDelete = false;

  @action
  void setIsDelete(bool value) => isDelete = value;

  @action
  void selectToDelete(int idPass) {
    if (!listShoppingToDelete.contains(idPass)) {
      listShoppingToDelete.add(idPass);
      setIsDelete(true);
    }
  }

  @action
  void removeToDelete(int idPass) {
    listShoppingToDelete.remove(idPass);

    if (listShoppingToDelete.length == 0) {
      setIsDelete(false);
    }
  }

  /// 
  /// Deleta os gastos
  /// 
  @action
  Future deletePasswordsSelecteds() async {    
    shopping.shoppings = shopping.shoppings.where((pass) {
      return !listShoppingToDelete.contains(pass.id);
    }).toList().asObservable();

    // await _storage.delete(listPasswordToDelete.join(','));

    listShoppingToDelete = <int>[].asObservable();
    setIsDelete(false);
  }
}