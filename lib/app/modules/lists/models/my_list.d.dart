import 'package:flutter/material.dart';

class MyList {
  int id;
  String name;
  bool concluded;
  List<ItemMyList> items;

  MyList({
    @required this.id, 
    @required this.name,
    @required this.concluded,
    @required  this.items
  });
}

class ItemMyList {
  final int id;
  String name;
  bool checked;

  ItemMyList({
    @required this.id, 
    @required this.name,
    @required this.checked,
  });
}

ItemMyList myItem11 = ItemMyList(id: 1, name: 'Sabonet', checked: false);
ItemMyList myItem12 = ItemMyList(id: 2, name: 'Escova de dentes', checked: false);
List<ItemMyList> myItems1 = [myItem11, myItem12];

ItemMyList myItem21 = ItemMyList(id: 1, name: 'Porta', checked: false);
ItemMyList myItem22 = ItemMyList(id: 2, name: 'Computador', checked: false);
ItemMyList myItem23 = ItemMyList(id: 2, name: 'Computador', checked: false);
List<ItemMyList> myItems2 = [myItem21, myItem22, myItem23];

MyList myList1 = MyList(id: 0, name: 'Comprar', concluded: true, items: myItems1);
MyList myList2 = MyList(id: 1, name: 'Verificar', concluded: false, items: myItems2);

List<MyList> myLists = [myList1, myList2];