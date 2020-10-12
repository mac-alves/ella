import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'my_list_item_store.dart';

part 'my_list_store.g.dart';

@Injectable()
class MyListStore = _MyListStoreBase with _$MyListStore;

abstract class _MyListStoreBase with Store {
  @observable
  int id;

  @observable
  String name;

  @observable
  bool concluded;

  @observable
  ObservableList<MyListItemStore> items;

  _MyListStoreBase({
    this.id,
    this.name,
    this.concluded = false,
    ObservableList<MyListItemStore> items,
  }) {
    this.items = items ?? ObservableList<MyListItemStore>();
  }

  @action
  setId(int value) => id = value;

  @action
  setName(String value) => name = value;

  @action
  setConcluded() {
    concluded = items.every((element) => element.checked);
  }
}
