import 'dart:async';
import 'dart:convert';

import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'hive_repository.g.dart';

@Injectable()
class HiveRepository extends Disposable {
  
  static String keyBoxIds;
  Completer<Box> _boxLists = Completer<Box>();
  Completer<Box> _boxIds = Completer<Box>();

  HiveRepository() {
    _init();
  }

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    print(dir.path);
    
    var openBoxLists = await Hive.openBox('db_lists');
    var openBoxIds = await Hive.openBox('box_ids');

    _boxLists.complete(openBoxLists);
    _boxIds.complete(openBoxIds);
  }
  
  @override
  void dispose() {
    Hive.close();
  }

  Future<List<MyListStore>> getAll() async {
    var box = await _boxLists.future;
    
    if (box.values.isEmpty) {
      return null;
    }

    try {
      var lists = List.generate(box.values.toList().length, (i) {
        return new MyListStore().fromJson(jsonDecode(box.values.toList()[i]));
      });

      return List.from(lists.reversed);
    } catch (e) {
      print(e);
    } 

    return [];
  }

  Future<MyListStore> get(int key) async {
    var box = await _boxLists.future;

    if (box.get('list_$key') == null) {
      return null;
    }

    try {
      return MyListStore().fromJson(
        jsonDecode(box.get('list_$key'))
      );      
    } catch (e) {
      print(e);
    }
    
    return null;
  }
  
  Future put(int key, Map<String, dynamic> value) async {
    var box = await _boxLists.future;
    box.put('list_$key', jsonEncode(value));
    putLastKey(key);
  }

  Future deleteAll() async {
    var box = await _boxLists.future;
    var boxIds = await _boxIds.future;
    box.clear();
    boxIds.clear();
  }

  Future delete(int key) async {
    var box = await _boxLists.future;
    box.delete('list_$key');
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
