import 'dart:async';
import 'dart:convert';

import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/shared/utils/item_select.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

part 'hive_repository.g.dart';

@Injectable()
class HiveRepository extends Disposable {
  
  String keyNextId = 'last_id_';
  String keyEstimate = 'estimate_';
  String keyIdsEstimates = 'id_estimate_';
  String keyFixedExpenses = 'fixed_expense_';
  String keyExpectedExpenses = 'expected_expense_';

  Completer<Box> _boxNextId = Completer<Box>();
  Completer<Box> _boxEstimates = Completer<Box>();
  Completer<Box> _boxIdsEstimates = Completer<Box>();
  Completer<Box> _boxFixedExpenses = Completer<Box>();
  Completer<Box> _boxExpectedExpenses = Completer<Box>();

  HiveRepository() {
    _init();
  }

  _init() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
        
    var openBoxNextId = await Hive.openBox('money_next_id');
    var openBoxEstimates = await Hive.openBox('money_estimates');
    var openBoxIdsEstimates = await Hive.openBox('money_ids_est');
    var openFixedExpenses = await Hive.openBox('money_fix_exp');
    var openExpectedExpenses = await Hive.openBox('money_exp_exp');

    _boxNextId.complete(openBoxNextId);
    _boxEstimates.complete(openBoxEstimates);
    _boxIdsEstimates.complete(openBoxIdsEstimates);
    _boxFixedExpenses.complete(openFixedExpenses);
    _boxExpectedExpenses.complete(openExpectedExpenses);
  }

  @override
  void dispose() {
    Hive.close();
  }

  ///
  /// Estimates ----------------------------------
  ///

  Future<EstimateStore> getEstimate(int key) async {
    var box = await _boxEstimates.future;

    if (box.get('$keyEstimate$key') == null) {
      return null;
    }

    try {
      return EstimateStore().fromJson(
        jsonDecode(box.get('$keyEstimate$key'))
      );      
    } catch (e) {
      print(e);
    }
    
    return null;
  }

  Future<List<EstimateStore>> getAllEstimates() async {
    var box = await _boxEstimates.future;
    
    if (box.values.isEmpty) {
      return null;
    }

    try {
      var lists = List.generate(box.values.toList().length, (i) {
        return new EstimateStore().fromJson(jsonDecode(box.values.toList()[i]));
      });

      return List.from(lists);
    } catch (e) {
      print(e);
    } 

    return [];
  }

  Future putEstimate(
    int key, 
    Map<String, dynamic> value, 
    { bool insertSpent = false, int keySpent }) async {
      
    var box = await _boxEstimates.future;
    box.put('$keyEstimate$key', jsonEncode(value));
    putLastKey(key, keyEstimate);

    if (insertSpent) {
      putLastKey(keySpent, '$keyFixedExpenses$keyExpectedExpenses');
    }
  }

  Future deleteAllEstimates() async {
    var box = await _boxEstimates.future;
    var boxIds = await _boxNextId.future;
    box.clear();
    boxIds.delete('$keyNextId$keyEstimate');
  }

  Future deleteEstimate(int key) async {
    var box = await _boxEstimates.future;
    await deleteIdEstimate(key);
    box.delete('$keyEstimate$key');
  }

  ///
  /// ids Estimates -------------------
  ///
  Future<List<ItemSelect>> getAllIdsEstimates() async { 
    var box = await _boxIdsEstimates.future;
    
    if (box.values.isEmpty) {
      return null;
    }

    try {
      var lists = List.generate(box.values.toList().length, (i) {
        return new ItemSelect().fromJson(jsonDecode(box.values.toList()[i]));
      });

      return List.from(lists.reversed);
    } catch (e) {
      print(e);
    } 

    return [];
  }

  Future putIdEstimate(int key, Map<String, dynamic> value) async {
    var box = await _boxIdsEstimates.future;
    box.put('$keyIdsEstimates$key', jsonEncode(value));
    putLastKey(key, keyIdsEstimates);
  }

  Future deleteAllIdsEstimates() async {
    var box = await _boxIdsEstimates.future;
    var boxIds = await _boxNextId.future;
    box.clear();
    boxIds.delete('$keyNextId$keyIdsEstimates');
  }

  Future deleteIdEstimate(int key) async {
    var box = await _boxIdsEstimates.future;
    box.delete('$keyIdsEstimates$key');
  }

  ///
  /// FixedExpenses or ExpectedExpenses -------------------
  ///

  Future<SpentStore> getFixedOrExpectedExpense(int key, String type) async {

    if (type != keyFixedExpenses && type != keyExpectedExpenses) {
      return null;
    }

    var box = type == keyFixedExpenses 
      ? await _boxFixedExpenses.future
      : await _boxExpectedExpenses.future;

    if (box.get('$type$key') == null) {
      return null;
    }

    try {
      return SpentStore().fromJson(
        jsonDecode(box.get('$type$key'))
      );      
    } catch (e) {
      print(e);
    }
    
    return null;
  }

  Future<List<SpentStore>> getAllFixedOrExpectedExpenses(String type) async {
    
    if (type != keyFixedExpenses && type != keyExpectedExpenses) {
      return null;
    }

    var box = type == keyFixedExpenses 
      ? await _boxFixedExpenses.future
      : await _boxExpectedExpenses.future;
    
    if (box.values.isEmpty) {
      return null;
    }

    try {
      var lists = List.generate(box.values.toList().length, (i) {
        return new SpentStore().fromJson(jsonDecode(box.values.toList()[i]));
      });

      return List.from(lists.reversed);
    } catch (e) {
      print(e);
    } 

    return [];
  }

  Future putFixedOrExpectedExpense(
    int key, String type, Map<String, dynamic> value) async {
    
    if (type != keyFixedExpenses && type != keyExpectedExpenses) {
      return null;
    }

    var box = type == keyFixedExpenses 
      ? await _boxFixedExpenses.future
      : await _boxExpectedExpenses.future;

    box.put('$type$key', jsonEncode(value));
    putLastKey(key, '$keyFixedExpenses$keyExpectedExpenses');
  }

  Future deleteAllFixedOrExpectedExpenses(String type) async {
    
    if (type != keyFixedExpenses && type != keyExpectedExpenses) {
      return null;
    }

    var box = type == keyFixedExpenses 
      ? await _boxFixedExpenses.future
      : await _boxExpectedExpenses.future;

    var boxIds = await _boxNextId.future;
    box.clear();
    boxIds.delete('$keyNextId$keyFixedExpenses$keyExpectedExpenses');
  }

  Future deleteFixedOrExpectedExpense(String keys, String type) async {
    
    if (type != keyFixedExpenses && type != keyExpectedExpenses) {
      return null;
    }

    List<int> arrKeys = keys.split(',').map((key) => int.parse(key)).toList();

    if (arrKeys.length == 0) {
      return null;
    }

    var box = type == keyFixedExpenses 
      ? await _boxFixedExpenses.future
      : await _boxExpectedExpenses.future;

    for (var i = 0; i <= arrKeys.length - 1; i++) {
      int key = arrKeys[i];
      box.delete('$type$key');
    }
  }

  ///
  /// Next ID -------------------
  ///

  Future<int> getLastKey(String type) async {
    var box = await _boxNextId.future;
    
    if (box.get('$keyNextId$type') == null) {
      return 0;
    }

    return box.get('$keyNextId$type') as int;
  }

  Future putLastKey(int key, String type) async {
    var boxIds = await _boxNextId.future;
    boxIds.put('$keyNextId$type', key);
  }
}
