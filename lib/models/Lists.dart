import 'package:flutter/material.dart';

class ListHome {
  final String name;
  final GestureTapCallback press;
  final IconData icon;

  ListHome({
    @required this.name, 
    @required this.press, 
    @required this.icon
  });
}

ListHome list1 = ListHome(name: 'Comprar',icon: Icons.check_circle, press: () {});
ListHome list2 = ListHome(name: 'Verificar',icon: Icons.data_usage, press: () {});

List<ListHome> listsHome = [list1, list2, list2, /* list2, list2, list2, list2, list1, list2, list2, list2, list2, list2, list2 */];


class ListRead {
  final int id;
  final String name;
  final List<ItemListRead> items;

  ListRead({
    @required this.id, 
    @required this.name,
    @required this.items,
  });
}

class ItemListRead {
  final int id;
  final String name;
  bool checked;

  ItemListRead({
    @required this.id, 
    @required this.name,
    @required this.checked,
  });
}


ItemListRead itemR1 = ItemListRead(id: 1, name: 'Sabonet', checked: false);
ItemListRead itemR2 = ItemListRead(id: 2, name: 'Escova de dentes', checked: false);

List<ItemListRead> itemsR = [itemR1, itemR2];

ListRead listRead = new ListRead(id: 1, name: 'Comprar', items: itemsR);


class ListCreate {
  final int id;
  String name;
  final List<ItemListCreate> items;

  ListCreate({
    @required this.id, 
    @required this.name,
    @required this.items,
  });
}

class ItemListCreate {
  final int id;
  String name;

  ItemListCreate({
    @required this.id, 
    @required this.name,
  });
}

ListCreate listCreate = new ListCreate(id: 1, name: null, items: []);