import 'package:ella/app/modules/password/interfaces/local_storage.dart';
import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:ella/app/modules/password/password_controller.dart';
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
}
