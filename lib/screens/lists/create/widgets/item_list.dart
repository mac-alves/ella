import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  final void Function(String) change;
  final GestureTapCallback press;
  final String value;

  const ItemList({
    Key key, 
    @required this.press, 
    @required this.change,
    @required this.value,
  }) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();
    myController.text = widget.value;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10
      ),
      child: SizedBox(
        height: 45,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: myController,
                  onChanged: widget.change,
                  decoration: InputDecoration(
                    hintText: 'Nome do item',
                    hintStyle: TextStyle(
                      color: listsApp.textColor,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: 10,
                      // top: 10
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: listsApp.iconColor,
                ), 
                onPressed: widget.press
              )
            ],
          ),
        ),
      ),
    );
  }
}