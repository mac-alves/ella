import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/password_store.dart';

part 'password_controller.g.dart';

@Injectable()
class PasswordController = _PasswordControllerBase with _$PasswordController;

abstract class _PasswordControllerBase with Store {
  
  @observable
  ObservableList<PasswordStore> passwords = <PasswordStore>[
    new PasswordStore(
      id: 23,
      title: 'Netflix',
      password: '45vgweregi84i8vnrasdasds_sadasdasdsaasdgsdasdswwdasd',
      selected: false,
      visible: false,
    ),
    new PasswordStore(
      id: 33,
      title: 'Amazon Prime',
      password: '45vgweregi84i8vnr',
      selected: false,
      visible: false,
    ),
    new PasswordStore(
      id: 43,
      title: 'Serasa',
      password: '45vgweregi84i8vnr',
      selected: false,
      visible: false,
    ),
  ].asObservable();

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
