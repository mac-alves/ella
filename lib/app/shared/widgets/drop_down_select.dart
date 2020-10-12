import 'package:ella/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemSelect {
  final String id;
  final String name;

  ItemSelect({
    @required this.id, 
    @required this.name
  });
}

ItemSelect fixos = new ItemSelect(id: '1', name: 'Fixo');
ItemSelect previsto = new ItemSelect(id: '2', name: 'Previsto');
ItemSelect variado = new ItemSelect(id: '3', name: 'Variado');

List<ItemSelect> itens = [fixos, previsto, variado];

class DropDownSelect extends StatefulWidget {
  DropDownSelect({ Key key }) : super(key: key);

  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelect> {
  String valueSelected = itens[0].id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 3
            ),
            alignment: Alignment.centerLeft, 
            child: Text(
              "Tipo",
              style: TextStyle(
                fontSize: 14,
                color: listsApp.textColor
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 15,
              top: 5,
              right: 10
            ),
            height: 56,
            decoration: BoxDecoration(
              color: listsApp.primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: DropdownButton<String>(
              hint: Text(
                "Selecione um tipo",
                style: TextStyle(
                  color: listsApp.textColor,
                  fontSize: 14
                ),
              ),
              isExpanded: true,
              value: valueSelected,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: listsApp.iconColor,
              ),
              iconSize: 34,
              elevation: 16,
              style: TextStyle(
                fontSize: 14,
                color: listsApp.textColor,
              ),
              underline: Container(
                height: 0,
              ),
              onChanged: (String newValue) {
                setState(() {
                  valueSelected = newValue;
                });
              },
              items: itens.map<DropdownMenuItem<String>>((ItemSelect item) {
                  return DropdownMenuItem<String>(
                    value: item.id,
                    child: Text(item.name),
                  );
                }).toList(),
            )
          ),
        ],
      ),
    );
  }
}