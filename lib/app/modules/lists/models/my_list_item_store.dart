import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'my_list_item_store.g.dart';

@Injectable()
class MyListItemStore = _MyListItemStoreBase with _$MyListItemStore;

abstract class _MyListItemStoreBase with Store {
  @observable
  int id;

  @observable
  String name;

  @observable
  bool checked;

  _MyListItemStoreBase({
    this.id,
    this.name,
    this.checked = false
  });

  @action
  setId(int value) => id = value;
  
  @action
  setName(String value) => name = value;

  @action
  setChecked() => checked = !checked;
}
