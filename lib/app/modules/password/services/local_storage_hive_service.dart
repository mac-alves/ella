import 'package:ella/app/modules/password/interfaces/local_storage.dart';
import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:ella/app/modules/password/repositories/local_storage/hive/hive_repository.dart';
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
  Future<List<PasswordStore>> getAllPasswords() async {
    return await hiveRepo.getAllPasswords();
  }

  @override
  Future<PasswordStore> getPassword(int key) async {
    return await hiveRepo.getPassword(key);
  }
  
  @override
  Future putPassword(int key, Map<String, dynamic> value) async {
    await hiveRepo.put(key, value);
  }

  @override
  Future<int> getNextKey() async {
    int id = await hiveRepo.getLastKey();
    return id + 2;
  }
}
