
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'my_list_item_store.g.dart';

@Injectable()
class MyListItemStore extends _MyListItemStoreBase with _$MyListItemStore {

  MyListItemStore({
    int id,
    int idList,
    String name,
    bool checked,
    List<MyListItemStore> items: const []}
  ) : super(id: id, idList: idList, name: name, checked: checked);


  MyListItemStore fromJson(Map<String, dynamic> json) {
    return new MyListItemStore(
      id: json['id'],
      idList: json['idList'],
      name: json['name'],
      checked: json['checked']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idList'] = this.idList;
    data['name'] = this.name;
    data['checked'] = this.checked;
    return data;
  }
}

abstract class _MyListItemStoreBase with Store {

  @observable
  int id;

  @observable
  int idList;

  @observable
  String name;

  @observable
  bool checked;


  _MyListItemStoreBase({
    this.id,
    this.idList,
    this.name,
    this.checked = false,
  });

  @action
  setId(int value) => id = value;
  
  @action
  setName(String value) => name = value;

  @action
  setChecked() => checked = !checked;

  @action
  setIdList(int value) => idList = value;
}