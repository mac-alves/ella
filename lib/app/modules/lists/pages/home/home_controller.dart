import 'package:ella/app/modules/lists/lists_controller.dart';
import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ListsController lists;

  _HomeControllerBase(this.lists) {
    lists.myLists.addAll([
      new MyListStore(
        id: 0, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 1, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 2, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 3, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 4, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 5, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 6, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 7, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 8, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 9, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 10, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 11, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 12, 
        name: 'Comprar', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),
      new MyListStore(
        id: 13, 
        name: 'Utimo', 
        concluded: false, 
        items: [
          new MyListItemStore(id: 1, name: 'Sabonet', checked: false),
          new MyListItemStore(id: 2, name: 'Escova de dentes', checked: false)
        ].asObservable()
      ),

    ]);
  }
}
