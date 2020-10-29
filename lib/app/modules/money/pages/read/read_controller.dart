import 'package:ella/app/modules/money/money_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'read_controller.g.dart';

@Injectable()
class ReadController = _ReadControllerBase with _$ReadController;

abstract class _ReadControllerBase with Store {
  final MoneyController lists;

  _ReadControllerBase(this.lists);
}
