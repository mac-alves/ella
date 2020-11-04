import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'spent_controller.g.dart';

@Injectable()
class SpentController = _SpentControllerBase with _$SpentController;

abstract class _SpentControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
