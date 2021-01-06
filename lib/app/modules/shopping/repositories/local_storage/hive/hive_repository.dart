import 'dart:async';
import 'dart:convert';

import 'package:ella/app/modules/shopping/models/shopping_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'hive_repository.g.dart';

@Injectable()
class HiveRepository extends Disposable {
  
  Completer<Box> _boxShoppings = Completer<Box>();
  Completer<Box> _boxIds = Completer<Box>();

  HiveRepository() {
    _init();
  }

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
        
    var openBoxShoppings = await Hive.openBox('db_shoppings');
    var openBoxIds = await Hive.openBox('shoppings_next_id');

    _boxShoppings.complete(openBoxShoppings);
    _boxIds.complete(openBoxIds);
  }

  @override
  void dispose() {
    Hive.close();
  }

  Future<List<ShoppingStore>> getAllShoppings() async {
    var box = await _boxShoppings.future;
    
    if (box.values.isEmpty) {
      return null;
    }

    try {
      var lists = List.generate(box.values.toList().length, (i) {
        return new ShoppingStore().fromJson(jsonDecode(box.values.toList()[i]));
      });

      return List.from(lists.reversed);
    } catch (e) {
      print(e);
    } 

    return [];
  }

  Future<ShoppingStore> getShopping(int key) async {
    var box = await _boxShoppings.future;

    if (box.get('shopp_$key') == null) {
      return null;
    }

    try {
      return ShoppingStore().fromJson(
        jsonDecode(box.get('shopp_$key'))
      );      
    } catch (e) {
      print(e);
    }
    
    return null;
  }

  Future putShopping(int key, Map<String, dynamic> value) async {
    var box = await _boxShoppings.future;
    box.put('shopp_$key', jsonEncode(value));
    putLastKey(key);
  }

  Future delete(String keys) async {

    List<int> arrKeys = keys.split(',').map((key) => int.parse(key)).toList();

    if (arrKeys.length == 0) {
      return null;
    }

    var box = await _boxShoppings.future;

    for (var i = 0; i <= arrKeys.length - 1; i++) {
      int key = arrKeys[i];
      box.delete('shopp_$key');
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
