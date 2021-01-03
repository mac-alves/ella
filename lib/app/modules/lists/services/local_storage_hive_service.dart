import 'package:ella/app/modules/lists/interfaces/local_storage.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/repositories/local_storage/hive/hive_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'local_storage_hive_service.g.dart';

@Injectable()
class LocalStorageHiveService extends Disposable implements ILocalStorage {
  
  HiveRepository hiveRepo;

  LocalStorageHiveService(this.hiveRepo);

  //dispose will be called automatically
  @override
  void dispose() {}
  
  @override
  Future<List<MyListStore>> getAll() async {
    return await hiveRepo.getAll();
  }

  @override
  Future<MyListStore> get(int idList) async {
    MyListStore list = await hiveRepo.get(idList);    
    return list;
  }
  
  @override
  Future put(int key, Map<String, dynamic> value) async {
    await hiveRepo.put(key, value);
  }

  @override
  Future delete(String keys) async {
    await hiveRepo.delete(keys);
  }

  @override
  Future<int> getNextKey() async {
    int id = await hiveRepo.getLastKey();
    return id + 2;
  }
}
