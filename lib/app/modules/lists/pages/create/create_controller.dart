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
  bool isValidate = false;

  @observable
  int idNewList;

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
  void setVali(bool value) => isValidate = value;

  @action
  Future addList(MyListStore list) async {
    print(list.id);
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

  @computed
  bool get listIsValid {
    return validateNameList() == null && 
           validateAllItemsList() == null;
  }

  String validateNameList(){
    if (!isValidate){
      return null;
    }

    if (newMyList.name == null || newMyList.name.isEmpty) {
      return 'Campo obrigátorio';
    }

    return null;
  }

  String validateAllItemsList(){
    if (!isValidate){
      return null;
    }

    var valid = newMyList
      .items.every((item) => item.name != null && item.name.isNotEmpty);

    if (!valid) {
      return 'Há item sem nome.';
    }
    
    if (newMyList.items.length == 0) {
      return 'Adicione um item.';
    }

    return null;
  }
}
