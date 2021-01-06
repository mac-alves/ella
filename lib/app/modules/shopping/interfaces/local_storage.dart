import 'package:ella/app/modules/shopping/models/shopping_store.dart';

abstract class ILocalStorage {
  Future<List<ShoppingStore>> getAllShoppings();
  Future<ShoppingStore> getShopping(int key);
  Future putShopping(int key, Map<String, dynamic> value);
  Future delete(String keys);
  Future<int> getNextKey();
}