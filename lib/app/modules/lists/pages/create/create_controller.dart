import 'dart:math';

import 'package:ella/app/modules/lists/lists_controller.dart';
import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'create_controller.g.dart';

@Injectable()
class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  
  Random random = new Random();
  final ListsController lists;

  MyListStore newMyList;

  @observable
  bool isValidate = false;

  _CreateControllerBase(this.lists) {
    newMyList = new MyListStore(
      id: random.nextInt(10000000), 
      name: null,
      concluded: false,
    );
  }

  @action
  void setVali(bool value){
    isValidate = value;
  }

  @action
  void addList(MyListStore list) {
    lists.myLists.add(list);
  }

  @action
  void updateList(MyListStore list) {
    // lists.myLists.add(list);
    list.setConcluded();
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
