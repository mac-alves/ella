import 'package:ella/app/modules/lists/interfaces/local_storage.dart';
import 'package:ella/app/modules/lists/lists_controller.dart';
import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'read_controller.g.dart';

@Injectable()
class ReadController = _ReadControllerBase with _$ReadController;

abstract class _ReadControllerBase with Store {
  
  final ILocalStorage storage;
  final ListsController lists;

  _ReadControllerBase(this.lists, this.storage);

  @action
  Future setChecked(MyListItemStore item, MyListStore list) async {
    item.setChecked();
    list.setConcluded();
    await storage.put(list.id, list.toJson());
  }

  @action
  Future removeList(MyListStore item) async {
    lists.myLists.removeWhere((element) => element.id == item.id);
    await storage.delete(item.id);
  }
}
