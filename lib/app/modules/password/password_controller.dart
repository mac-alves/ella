import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'password_controller.g.dart';

@Injectable()
class PasswordController = _PasswordControllerBase with _$PasswordController;

abstract class _PasswordControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
