import 'package:ella/app/modules/shopping/interfaces/local_storage.dart';
import 'package:ella/app/modules/shopping/models/shopping_store.dart';
import 'package:ella/app/modules/shopping/repositories/local_storage/hive/hive_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'local_storage_hive_service.g.dart';

@Injectable()
class LocalStorageHiveService extends Disposable implements ILocalStorage{
  
  HiveRepository hiveRepo;

  LocalStorageHiveService(this.hiveRepo);

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future delete(String keys) async {
    return await hiveRepo.delete(keys);
  }
  
  @override
  Future<List<ShoppingStore>> getAllShoppings() async {
    return await hiveRepo.getAllShoppings();
  }

  @override
  Future<ShoppingStore> getShopping(int key) async {
    return await hiveRepo.getShopping(key);
  }

  @override
  Future putShopping(int key, Map<String, dynamic> value) async {
    await hiveRepo.putShopping(key, value);
  }

  @override
  Future<int> getNextKey() async {
    int id = await hiveRepo.getLastKey();
    return id + 2;
  }
  
}
