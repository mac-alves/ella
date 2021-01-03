import 'dart:math';

import 'package:ella/app/modules/lists/interfaces/local_storage.dart';
import 'package:ella/app/modules/lists/lists_controller.dart';
import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'create_controller.g.dart';

@Injectable()
class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  
  final ILocalStorage _storage = Modular.get();
  final ListsController lists;
  Random random = new Random();

  @observable
  MyListStore newMyList;

  @observable
  int idNewList;

  @observable
  bool erroName = false;

  @observable
  bool erroItems = false;

  @observable
  String msgErroItems = 'Adicione um item.';

  _CreateControllerBase(this.lists) {
    _init();
  }

  _init() async {
    int id = await _storage.getNextKey();
    setIdNewList(id);
  }

  @action
  void setNewMyList(MyListStore value) => newMyList = value;

  @action
  void setIdNewList(int value) => idNewList = value;

  @action
  void setErroName(bool value) => erroName = value;

  @action
  void setErroItems(bool value) => erroItems = value;

  @action
  void setMsgErroItems(String value) => msgErroItems = value;

  @action
  Future addList(MyListStore list) async {
    lists.myLists.insert(0, list);
    await _storage.put(list.id, list.toJson());
  }

  @action
  Future updateList(MyListStore list) async {
    list.setConcluded();
    await _storage.put(list.id, list.toJson());
  }

  @action
  addListItem(MyListStore list) {
    list.items.add(
      new MyListItemStore(
        id: random.nextInt(1000000),
        name: null,
        checked: false
      )
    );
  }

  @action
  removeListItem(MyListStore list, MyListItemStore item) {
    list.items.removeWhere((element) => element.id == item.id);
  }

  bool listIsValid() {
    bool validName = validateNameList();
    bool validItems = validateAllItemsList();

    if (validName && validItems) {
      return true;
    }

    return false;
  }

  bool validateNameList(){
    if (newMyList.name == null || newMyList.name.isEmpty) {
      setErroName(true);
      return false;
    }
    
    setErroName(false);
    return true;
  }

  bool validateAllItemsList(){
    var valid = newMyList
      .items.every((item) => item.name != null && item.name.isNotEmpty);

    if (!valid) {
      setMsgErroItems('Há item sem nome.');
      setErroItems(true);
      return false;
    }
    
    if (newMyList.items.length == 0) {
      setMsgErroItems('Adicione um item.');
      setErroItems(true);
      return false;
    }

    setErroItems(false);
    return true;
  }
}
