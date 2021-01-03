import 'package:ella/app/modules/password/models/password_store.dart';

abstract class ILocalStorage {
  Future<List<PasswordStore>> getAllPasswords();
  Future<PasswordStore> getPassword(int key);
  Future putPassword(int key, Map<String, dynamic> value);
  Future delete(String keys);
  Future<int> getNextKey();
}