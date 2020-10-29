import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'money_controller.g.dart';

@Injectable()
class MoneyController = _MoneyControllerBase with _$MoneyController;

abstract class _MoneyControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
