import 'dart:async';
import 'dart:convert';

import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'hive_repository.g.dart';

@Injectable()
class HiveRepository extends Disposable {

  Completer<Box> _boxPasswords = Completer<Box>();
  Completer<Box> _boxIds = Completer<Box>();

  HiveRepository(){
    _init();
  }

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
        
    var openBoxPasswords = await Hive.openBox('db_passwords');
    var openBoxIds = await Hive.openBox('passwords_next_id');

    _boxPasswords.complete(openBoxPasswords);
    _boxIds.complete(openBoxIds);
  }
  
  @override
  void dispose() {
    Hive.close();
  }

  Future<List<PasswordStore>> getAllPasswords() async {
    var box = await _boxPasswords.future;
    
    if (box.values.isEmpty) {
      return null;
    }

    try {
      var lists = List.generate(box.values.toList().length, (i) {
        return new PasswordStore().fromJson(jsonDecode(box.values.toList()[i]));
      });

      return List.from(lists.reversed);
    } catch (e) {
      print(e);
    } 

    return [];
  }

  Future<PasswordStore> getPassword(int key) async {
    var box = await _boxPasswords.future;

    if (box.get('pass_$key') == null) {
      return null;
    }

    try {
      return PasswordStore().fromJson(
        jsonDecode(box.get('pass_$key'))
      );      
    } catch (e) {
      print(e);
    }
    
    return null;
  }

  Future put(int key, Map<String, dynamic> value) async {
    var box = await _boxPasswords.future;
    box.put('pass_$key', jsonEncode(value));
    putLastKey(key);
  }

  Future delete(String keys) async {

    List<int> arrKeys = keys.split(',').map((key) => int.parse(key)).toList();

    if (arrKeys.length == 0) {
      return null;
    }

    var box = await _boxPasswords.future;

    for (var i = 0; i <= arrKeys.length - 1; i++) {
      int key = arrKeys[i];
      box.delete('pass_$key');
    }
  }

  Future<int> getLastKey() async {
    var box = await _boxIds.future;
    
    if (box.get('last_key') == null) {
      return 0;
    }

    return box.get('last_key') as int;
  }

  Future putLastKey(int key) async {
    var boxIds = await _boxIds.future;
    boxIds.put('last_key', key);
  }
}
