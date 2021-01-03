import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:ella/app/modules/password/password_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'create_controller.g.dart';

@Injectable()
class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  
  final PasswordController password;

  _CreateControllerBase(this.password);

  @observable
  PasswordStore newPassword;

  @observable
  int idNewPassword;

  @observable
  bool erroTitle = false;

  @observable
  bool erroPassword = false;

  @observable
  String msgErroTitle = 'Nome invalido.';

  @observable
  String msgErroPassword = 'Senha invalida';

  @observable
  bool isEdit = false;

  @action
  void setNewPassword(PasswordStore value) => newPassword = value;

  @action
  void setIdNewPassword(int value) => idNewPassword = value;
  
  @action
  void setErroTitle(bool value) => erroTitle = value;

  @action
  void setErroPassword(bool value) => erroPassword = value;
  
  @action
  void setMsgErroTitle(String value) => msgErroTitle = value;

  @action
  void setMsgErroPassword(String value) => msgErroPassword = value;

  @action
  void setIsEdit(bool value) => isEdit = value;

  @action
  Future createPassword(PasswordStore pass) async {
    PasswordStore newPass = PasswordStore().fromJson(pass.toJson());
    password.passwords.insert(0, newPass);
    // await _storage.put(newPass.id, newPass.toJson());
  }

  @action
  Future updatePassword(PasswordStore pass) async {
    PasswordStore newPass = PasswordStore().fromJson(pass.toJson());

    for (var i = 0; i < password.passwords.length; i++) {
      if (password.passwords[i].id == newPass.id) {
        password.passwords[i] = newPass;
      }
    }

    // adiciona no banco
    // _storage.putFixedExpense(int.parse(newPass.id), newPass.toJson());
  }

  bool validateNewPassword(){
    bool validTitle = validateTitle();
    bool validPass = validatePassword();

    return (validTitle && validPass) ? true : false;
  }

  bool validateTitle(){
    newPassword.setTitle(newPassword.title == null ? null : newPassword.title.trim());

    if (newPassword.title == null || newPassword.title.isEmpty) {
      setMsgErroTitle('Nome inválido.');
      setErroTitle(true);
      return false;
    }

    var exist = password.passwords.firstWhere(
      (pass) => pass.title == newPassword.title,
      orElse: () => null
    );

    if (exist != null && exist.id != newPassword.id) {
      setMsgErroTitle('Ja existe uma senha com esse nome.');
      setErroTitle(true);
      return false;
    }
    
    setErroTitle(false);
    return true;
  }

  bool validatePassword(){
    newPassword.setPassword(
      newPassword.password == null ? null : newPassword.password.trim()
    );
    
    if (newPassword.password == null || newPassword.password.isEmpty) {
      setMsgErroPassword('Senha inválida.');
      setErroPassword(true);
      return false;
    }
    
    setErroPassword(false);
    return true;
  }
}
