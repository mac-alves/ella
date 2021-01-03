import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/password_store.dart';

part 'password_controller.g.dart';

@Injectable()
class PasswordController = _PasswordControllerBase with _$PasswordController;

abstract class _PasswordControllerBase with Store {
  
  @observable
  ObservableList<PasswordStore> passwords = <PasswordStore>[].asObservable();

  @observable
  String passwordLogin;

  @action
  void setPasswordLogin(String value) => passwordLogin = value;

  @action
  PasswordStore getPassword(int id){
    PasswordStore pass =  passwords.firstWhere(
      (element) => element.id == id, 
      orElse: () => null
    );

    if (pass != null) {
      pass = PasswordStore().fromJson(pass.toJson());
    }

    return pass;
  }
}
