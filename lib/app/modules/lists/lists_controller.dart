import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/my_list_store.dart';

part 'lists_controller.g.dart';

@Injectable()
class ListsController = _ListsControllerBase with _$ListsController;

abstract class _ListsControllerBase with Store {

  @observable
  ObservableList<MyListStore> myLists = <MyListStore>[].asObservable();

  _ListsControllerBase();

  @action
  MyListStore getList(int id){
    return myLists.firstWhere(
      (element) => element.id == id,
      orElse: () => null
    );
  }
}
