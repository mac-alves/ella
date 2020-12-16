import 'package:ella/app/modules/money/interfaces/local_storage.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/repositories/local_storage/hive/hive_repository.dart';
import 'package:ella/app/shared/utils/item_select.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'local_storage_hive_service.g.dart';

@Injectable()
class LocalStorageHiveService extends Disposable implements ILocalStorage {
  
  HiveRepository hiveRepo;

  LocalStorageHiveService(this.hiveRepo);

  @override
  void dispose() {}

  ///
  /// Delete -------------------
  ///

  @override
  Future deleteEstimate(int key) async {
    await hiveRepo.deleteEstimate(key);
  }

  @override
  Future deleteFixedExpense(String keys) async {
    await hiveRepo.deleteFixedOrExpectedExpense(keys, hiveRepo.keyFixedExpenses);
  }

  @override
  Future deleteExpectedExpense(String keys) async {
    await hiveRepo.deleteFixedOrExpectedExpense(keys, hiveRepo.keyExpectedExpenses);
  }

  ///
  /// Delete All -------------------
  ///

  @override
  Future deleteAllEstimates() async {
    await hiveRepo.deleteAllEstimates();
  }

  @override
  Future deleteAllFixedExpenses() async {
    await hiveRepo.deleteAllFixedOrExpectedExpenses(hiveRepo.keyFixedExpenses);
  }

  @override
  Future deleteAllExpectedExpenses() async {
    await hiveRepo.deleteAllFixedOrExpectedExpenses(hiveRepo.keyExpectedExpenses);
  }

  ///
  /// Get -------------------
  ///

  @override
  Future<EstimateStore> getEstimate(int idEstimate) async {
    return await hiveRepo.getEstimate(idEstimate);
  }

  @override
  Future<SpentStore> getFixedExpense(int idFixedExpense) async {
    return await hiveRepo.getFixedOrExpectedExpense(
      idFixedExpense, hiveRepo.keyFixedExpenses
    );
  }

  @override
  Future<SpentStore> getExpectedExpense(int idExpectedExpense) async {
    return await hiveRepo.getFixedOrExpectedExpense(
      idExpectedExpense, hiveRepo.keyExpectedExpenses
    );
  }

  ///
  /// Get All -------------------
  ///

  @override
  Future<List<EstimateStore>> getAllEstimates() async {
    return await hiveRepo.getAllEstimates();
  }

  @override
  Future<List<ItemSelect>> getAllIdsEstimates() async {
    return await hiveRepo.getAllIdsEstimates();
  }

  @override
  Future<List<SpentStore>> getAllFixedExpenses() async {
    return await hiveRepo.getAllFixedOrExpectedExpenses(
      hiveRepo.keyFixedExpenses
    );
  }

  @override
  Future<List<SpentStore>> getAllExpectedExpenses() async {
    return await hiveRepo.getAllFixedOrExpectedExpenses(
      hiveRepo.keyExpectedExpenses
    );
  }

  ///
  /// Put -------------------
  ///

  @override
  Future putEstimate(
    int key, 
    Map<String, dynamic> value, 
    { bool insertSpent = false, int keySpent }) async {

    await hiveRepo.putEstimate(
      key, value, insertSpent: insertSpent, keySpent: keySpent);
  }

  @override
  Future putIdEstimate(int key, Map<String, dynamic> value) async{
    await hiveRepo.putIdEstimate(key, value);
  }

  @override
  Future putFixedExpense(int key, Map<String, dynamic> value) async {
    await hiveRepo.putFixedOrExpectedExpense(
      key, hiveRepo.keyFixedExpenses, value
    );
  }

  @override
  Future putExpectedExpense(int key, Map<String, dynamic> value) async {
    await hiveRepo.putFixedOrExpectedExpense(
      key, hiveRepo.keyExpectedExpenses, value
    );
  }

  ///
  /// Next ID -------------------
  ///

  @override
  Future<int> getNextIdEstimate() async {
    int id = await hiveRepo.getLastKey(hiveRepo.keyEstimate);
    return id + 2;
  }

  @override
  Future<int> getNextIdExpense() async {
    int id = await hiveRepo.getLastKey(
      '${hiveRepo.keyFixedExpenses}${hiveRepo.keyExpectedExpenses}'
    );
    return id + 2;
  }

  ///
  /// Save in local file -------------------
  ///
  
  @override
  Future<String> getDataToLocalFile() async {
    return await hiveRepo.getAllEstimatesToJson();
  }
}
