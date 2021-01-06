import 'package:ella/app/modules/shopping/models/shopping_item_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'shopping_store.g.dart';

@Injectable()
class ShoppingStore extends _ShoppingStoreBase with _$ShoppingStore{
  
  ShoppingStore({
    int id,
    String title,
    double amount,
    int qtItems,
    bool selected,
    List<ShoppingItemStore> items: const []
  }) : super(id: id, title: title, amount: amount, qtItems: qtItems, items: items);

  ShoppingStore fromJson(Map<String, dynamic> json) {
    ObservableList<ShoppingItemStore> items = <ShoppingItemStore>[].asObservable();
    
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new ShoppingItemStore().fromJson(v));
      });
    }

    return ShoppingStore(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      qtItems: json['qtItems'],
      selected: json['selected'],
      items: items
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['amount'] = this.amount;
    data['qtItems'] = this.qtItems;
    data['selected'] = this.selected;

    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    
    return data;
  }
}

abstract class _ShoppingStoreBase with Store {
  
  @observable
  int id;

  @observable
  String title;

  @observable
  double amount;

  @observable
  int qtItems;

  @observable
  bool selected;

  @observable
  ObservableList<ShoppingItemStore> items = <ShoppingItemStore>[].asObservable();

  _ShoppingStoreBase({
    this.id,
    this.title,
    this.amount,
    this.qtItems,
    this.selected = false,
    List<ShoppingItemStore> items
  }) {
    this.items = items.asObservable() ?? <ShoppingItemStore>[].asObservable();
  }

  @action
  setId(int value) => id = value;

  @action
  setTitle(String value) => title = value;

  @action
  setAmount(double value) => amount = value;

  @action
  setQtItems(int value) => qtItems = value;

  @action
  setSelected(bool value) => selected = value;
}
