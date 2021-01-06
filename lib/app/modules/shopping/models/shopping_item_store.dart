import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'shopping_item_store.g.dart';

@Injectable()
class ShoppingItemStore extends _ShoppingItemStoreBase with _$ShoppingItemStore{
  ShoppingItemStore({
    int id,
    String qt,
    String name,
    String value,
    String error
  }) : super(id: id, qt: qt, name: name, value: value, error: error);


  ShoppingItemStore fromJson(Map<String, dynamic> json) {
    return new ShoppingItemStore(
      id: json['id'],
      qt: json['qt'],
      name: json['name'],
      value: json['value'],
      error: json['error']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qt'] = this.qt;
    data['name'] = this.name;
    data['value'] = this.value;
    data['error'] = this.error;
    
    return data;
  }
}

abstract class _ShoppingItemStoreBase with Store {
  
  @observable
  int id;

  @observable
  String qt;

  @observable
  String name;

  @observable
  String value;

  @observable
  String error;

  _ShoppingItemStoreBase({
    this.id,
    this.qt,
    this.name,
    this.value,
    this.error,
  });

  @action
  setId(int value) => id = value;
  
  @action
  setQt(String value) => qt = value;

  @action
  setName(String value) => name = value;

  @action
  setValue(String newValue) => value = newValue;

  @action
  setError(String value) => error = value;
}
