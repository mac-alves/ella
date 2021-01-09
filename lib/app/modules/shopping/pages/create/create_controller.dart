import 'dart:math';

import 'package:ella/app/modules/shopping/interfaces/local_storage.dart';
import 'package:ella/app/modules/shopping/models/shopping_item_store.dart';
import 'package:ella/app/modules/shopping/models/shopping_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shopping_controller.dart';

part 'create_controller.g.dart';

@Injectable()
class CreateController = _CreateControllerBase with _$CreateController;

abstract class _CreateControllerBase with Store {
  
  final ILocalStorage _storage = Modular.get();
  final ShoppingController shopping;
  Random random = new Random();

  _CreateControllerBase(this.shopping){
    _init();
  }

  _init() async {
    int id = await _storage.getNextKey();
    setIdNewShopping(id);
  }

  @observable
  ShoppingStore newShopping;

  @observable
  int idNewShopping;

  @observable
  bool erroTitle = false;

  @observable
  bool erroItems = false;

  @observable
  String msgErroItems = 'Deve haver ao menos um item.';

  @observable
  double amount = 0.0;

  @observable
  int qtItems = 0;

  @action
  void setNewShopping(ShoppingStore value) => newShopping = value;

  @action
  void setIdNewShopping(int value) => idNewShopping = value;

  @action
  void setErroTitle(bool value) => erroTitle = value;

  @action
  void setErroItems(bool value) => erroItems = value;

  @action
  void setMsgErroItems(String value) => msgErroItems = value;

  @action
  addItem() {
    newShopping.items.add(
      new ShoppingItemStore(
        id: random.nextInt(1000000),
        name: null,
        qt: '1',
        value: '0.00',
        error: ''
      )
    );

    setQtItems();
  }

  @action
  void setAmount() {
    amount = getDoubleTwoPrecision(
      newShopping.items.fold(0, 
        (prev, item) => prev + (int.parse(item.qt) * double.parse(item.value))
      ).toString()
    );

    setQtItems();
  }

  @action
  void setQtItems() {
    qtItems = newShopping.items.fold(0,
      (prev, item) => prev + int.parse(item.qt)
    );
  }

  /// 
  /// Obtem o valor para o campo com duas casas decimais
  /// 
  double getDoubleTwoPrecision(String value){
    return double.parse(double.parse(value).toStringAsFixed(2));
  }

  /// 
  /// Obtem o valor para o campo com duas casas decimais
  /// 
  String getTwoPrecision(String value) {
    return (value != null) ? double.parse(value).toStringAsFixed(2) : null;
  }

  @action
  Future createShopping(ShoppingStore shopp) async {
    ShoppingStore newShopp = prepareShoppingCreateOrUpdate(shopp);

    shopping.shoppings.insert(0, newShopp);
    await _storage.putShopping(newShopp.id, newShopp.toJson());
  }

  @action
  Future updateShopping(ShoppingStore shopp) async {
    ShoppingStore newShopp = prepareShoppingCreateOrUpdate(shopp);
    
    for (var i = 0; i < shopping.shoppings.length; i++) {
      if (shopping.shoppings[i].id == newShopp.id) {
        shopping.shoppings[i] = newShopp;
      }
    }

    // atualiza no banco
    _storage.putShopping(newShopp.id, newShopp.toJson());
  }

  ///
  /// Prepara a entidade antes de salvar ou atualziar
  ///
  ShoppingStore prepareShoppingCreateOrUpdate(ShoppingStore shopp) {
    ShoppingStore newShopp = ShoppingStore().fromJson(shopp.toJson());

    newShopp.setAmount(amount);
    newShopp.setQtItems(qtItems);
    newShopp.setSelected(false);
    newShopp.items = newShopp.items.map((item) {
      item.setName(item.name.trim());
      item.setError('');
      item.setValue(getTwoPrecision(item.value));

      return item;
    }).toList().asObservable();

    return newShopp;
  }

  ///
  /// Prepara a entidade antes de salvar ou atualziar
  ///
  void prepareShoppingToEdit(ShoppingStore shopp) {
    ShoppingStore editShopp = ShoppingStore().fromJson(shopp.toJson());
    setNewShopping(editShopp);
    setAmount();
  }

  bool shoppingIsValid() {
    bool validName = validateTitle();
    bool validItems = validateAllItems();

    if (validName && validItems) {
      return true;
    }

    return false;
  }

  bool validateTitle(){
    newShopping.setTitle(newShopping.title == null ? null : newShopping.title.trim());

    if (newShopping.title == null || newShopping.title.isEmpty) {
      setErroTitle(true);
      return false;
    }
    
    setErroTitle(false);
    return true;
  }

  bool validateAllItems(){
    bool valid = true;

    newShopping.items = newShopping.items.map((item) {
      bool name = (
        item.name != null && item.name.isNotEmpty && item.name.trim().length > 0);
      bool qt = (int.parse(item.qt) != 0);

      if (!name || !qt) {
        item.setError(
          "${name ? '' : 'name'}:${qt ? '' : 'qt'}"
        );

        valid = false;
      } else {
        item.setError('');
      }

      return item;
    }).toList().asObservable();

    if (!valid) {
      setMsgErroItems('Há item invalido.');
    }
    
    if (newShopping.items.length == 0) {
      setMsgErroItems('Deve haver ao menos um item.');
    }

    if (!valid || (newShopping.items.length == 0)) {
      setErroItems(true);
      return false;
    }

    setErroItems(false);
    return true;
  }
}
