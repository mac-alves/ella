import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:ella/app/modules/password/interfaces/local_storage.dart';
import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:ella/app/modules/password/password_controller.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final ILocalStorage _storage = Modular.get();
  final PasswordController password;

  _HomeControllerBase(this.password){
     _init();
  }

  _init() async {
    var localPasswords = await _storage.getAllPasswords();

    if (localPasswords == null) {
      password.passwords = <PasswordStore>[].asObservable();
    } else {
      password.passwords = localPasswords.asObservable();
    }
  }

  @observable
  ObservableList<int> listPasswordToDelete = <int>[].asObservable();

  @observable
  bool isDelete = false;

  @action
  void setIsDelete(bool value) => isDelete = value;

  @action
  void selectToDelete(int idPass) {
    if (!listPasswordToDelete.contains(idPass)) {
      listPasswordToDelete.add(idPass);
      setIsDelete(true);
    }
  }

  @action
  void removeToDelete(int idPass) {
    listPasswordToDelete.remove(idPass);

    if (listPasswordToDelete.length == 0) {
      setIsDelete(false);
    }
  }

  /// 
  /// Deleta os gastos
  /// 
  @action
  Future deletePasswordsSelecteds() async {    
    password.passwords = password.passwords.where((pass) {
      return !listPasswordToDelete.contains(pass.id);
    }).toList().asObservable();

    await _storage.delete(listPasswordToDelete.join(','));

    listPasswordToDelete = <int>[].asObservable();
    setIsDelete(false);
  }

  ///
  /// Obtem o diretorio de Downloads do sistema
  ///
  Future<String> get _localDownloadPath async {
    Directory downloadsDirectory;

    try {
      downloadsDirectory = await DownloadsPathProvider.downloadsDirectory;
    } on PlatformException {
      print('Could not get the downloads directory');
    }

    return downloadsDirectory.path;
  }

  Future<bool> downloadData() async {
    try {
      String dir = await _localDownloadPath;
      File file = new File('$dir/passwords.json');

      String data = await _storage.getDataToLocalFile();
      await file.writeAsString(data);

      return true;
    } catch (e) {
      print({'error': e});
      return false;
    }
  }
}
