import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/shared/utils/item_select.dart';

abstract class ILocalStorage {
  
  /// Get all
  Future<List<EstimateStore>> getAllEstimates();
  Future<List<SpentStore>> getAllFixedExpenses();
  Future<List<SpentStore>> getAllExpectedExpenses();
  Future<List<ItemSelect>> getAllIdsEstimates();
  
  /// Get 
  Future<EstimateStore> getEstimate(int idEstimate);
  Future<SpentStore> getFixedExpense(int idFixedExpense);
  Future<SpentStore> getExpectedExpense(int idExpectedExpense);
  
  /// Put 
  Future putEstimate(
    int key, Map<String, dynamic> value, 
    { bool insertSpent = false, int keySpent });
  Future putFixedExpense(int key, Map<String, dynamic> value);
  Future putExpectedExpense(int key, Map<String, dynamic> value);
  Future putIdEstimate(int key, Map<String, dynamic> value);
  
  /// Delete all
  Future deleteAllEstimates();
  Future deleteAllFixedExpenses();
  Future deleteAllExpectedExpenses();
  
  /// Delete
  Future deleteEstimate(int key);
  Future deleteFixedExpense(String keys);
  Future deleteExpectedExpense(String keys);
  
  /// Next ID
  Future<int> getNextIdEstimate();
  Future<int> getNextIdExpense();
  
  /// Data to local file
  Future<String> getDataToLocalFile();
}