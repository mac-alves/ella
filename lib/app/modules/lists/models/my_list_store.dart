import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'my_list_item_store.dart';

part 'my_list_store.g.dart';

@Injectable()
class MyListStore extends _MyListStoreBase with _$MyListStore {

  MyListStore({
    int id,
    String name,
    bool concluded,
    bool selected,
    List<MyListItemStore> items: const []}
  ) : super(
    id: id, 
    name: name, 
    concluded: concluded, 
    items: items,
    selected: selected
  );

  MyListStore fromJson(Map<String, dynamic> json) {
    ObservableList<MyListItemStore> items = <MyListItemStore>[].asObservable();
    
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new MyListItemStore().fromJson(v));
      });
    }

    return MyListStore(
      id: json['id'],
      name: json['name'],
      concluded: json['concluded'],
      selected: json['selected'],
      items: items
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['concluded'] = this.concluded;
    data['selected'] = this.selected;
    
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

abstract class _MyListStoreBase with Store {

  @observable
  int id;

  @observable
  String name;

  @observable
  bool concluded;

  @observable
  bool selected;

  @observable
  ObservableList<MyListItemStore> items = <MyListItemStore>[].asObservable();

  _MyListStoreBase({
    this.id,
    this.name,
    this.concluded = false,
    this.selected = false,
    List<MyListItemStore> items
  }) {
    this.items = items.asObservable() ?? <MyListItemStore>[].asObservable();
  }

  @action
  setId(int value) => id = value;

  @action
  setName(String value) => name = value;

  @action
  setConcluded() {
    concluded = items.every((element) => element.checked);
  }

  @action
  setSelected(bool value) => selected = value;
}