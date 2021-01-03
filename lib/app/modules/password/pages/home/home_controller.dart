import 'package:ella/app/modules/password/password_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final PasswordController password;

  _HomeControllerBase(this.password);

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
  deletePasswordsSelecteds(){    
    password.passwords = password.passwords.where((pass) {
      return !listPasswordToDelete.contains(pass.id);
    }).toList().asObservable();

    listPasswordToDelete = <int>[].asObservable();
    setIsDelete(false);
  }
}
