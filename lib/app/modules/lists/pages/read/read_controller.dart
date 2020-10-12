import 'package:ella/app/modules/lists/lists_controller.dart';
import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'read_controller.g.dart';

@Injectable()
class ReadController = _ReadControllerBase with _$ReadController;

abstract class _ReadControllerBase with Store {
  final ListsController lists;

  _ReadControllerBase(this.lists);

  @action
  void setChecked(MyListItemStore item, MyListStore list)  {
    item.setChecked();
    list.setConcluded();
  }

  @action
  void removeList(MyListStore item) {
    lists.myLists.removeWhere((element) => element.id == item.id);
  }
}
