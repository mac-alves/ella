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