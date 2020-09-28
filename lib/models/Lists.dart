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


ItemListRead item1 = ItemListRead(id: 1, name: 'Sabonet', checked: false);
ItemListRead item2 = ItemListRead(id: 1, name: 'Escova de dentes', checked: false);

List<ItemListRead> items = [item1, item2];

ListRead listRead = new ListRead(id: 1, name: 'Comprar', items: items);