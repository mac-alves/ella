import 'package:ella/app/modules/lists/models/my_list.d.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/my_list_item_store.dart';
import 'models/my_list_store.dart';

part 'lists_controller.g.dart';

@Injectable()
class ListsController = _ListsControllerBase with _$ListsController;

abstract class _ListsControllerBase with Store {
  
  @observable
  ObservableList<MyListStore> myLists = ObservableList<MyListStore>();

  @action
  List<MyListItemStore> getItemsList(int index) {
    return myLists[index].items;
  }

  @action
  MyListStore getList(int id){
    return myLists.firstWhere((element) => element.id == id);
  }
}
