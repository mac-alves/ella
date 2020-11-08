import 'package:flutter/material.dart';

class ItemSelect {
  final String id;
  final String name;

  ItemSelect({
    @required this.id, 
    @required this.name
  });
}

List<ItemSelect> months = [
  new ItemSelect(id: '1', name: 'Janeiro'),
  new ItemSelect(id: '2', name: 'Fevereiro'),
  new ItemSelect(id: '3', name: 'Março'),
  new ItemSelect(id: '4', name: 'Abril'),
  new ItemSelect(id: '5', name: 'Maio'),
  new ItemSelect(id: '6', name: 'Junho'),
  new ItemSelect(id: '7', name: 'Julho'),
  new ItemSelect(id: '8', name: 'Agosto'),
  new ItemSelect(id: '9', name: 'Setembro'),
  new ItemSelect(id: '10', name: 'Outubro'),
  new ItemSelect(id: '11', name: 'Novembro'),
  new ItemSelect(id: '12', name: 'Desembro'),
];

String getMonthById(String id){
  return months.firstWhere((month) => month.id == id).name;
}

String getIdByMonth(String name){
  return months.firstWhere((month) => month.name == name).id;
}