import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'create_controller.g.dart';

@Injectable()
class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  
  Random random = new Random();
  // @observable
  // PasswordStore newPassword;

  // @observable
  // int idNewPassword;

  @observable
  ObservableList<String> shoppingItems = <String>[].asObservable();

  @action
  addItem() {
    shoppingItems.add('${random.nextInt(1000000)}');
  }
}
