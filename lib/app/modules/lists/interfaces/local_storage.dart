import 'package:ella/app/modules/lists/models/my_list_store.dart';

abstract class ILocalStorage {
  Future<List<MyListStore>> getAll();
  Future<MyListStore> get(int idList);
  Future put(int key, Map<String, dynamic> value);
  Future deleteAll();
  Future delete(int key);
  Future<int> getNextKey();
}