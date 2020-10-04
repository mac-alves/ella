import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {

  final int id;
  final String name;
  final bool checked;
  final GestureTapCallback press;

  const ItemList({
    Key key, 
    @required this.id, 
    @required this.name, 
    @required this.checked,
    @required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: listsApp.defaultPadding,
        right: listsApp.defaultPadding,
        bottom: listsApp.defaultPadding / 2
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 3,
              color: Colors.black.withOpacity(0.16),
            ),
          ],
        ),
        child: FlatButton(
          onPressed: press,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          color: (checked) ? 
            Colors.white.withOpacity(0.8) : Colors.white,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 10
                ),
                child: Icon(
                  checked ? Icons.check : Icons.crop_din,
                  color: (checked) ? 
                    listsApp.iconColor.withOpacity(0.6) : listsApp.iconColor,
                  size: 25,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  decoration: (checked) ? TextDecoration.lineThrough : null,
                  fontSize: 15,
                  color: (checked) ? 
                    listsApp.textColor.withOpacity(0.6) : listsApp.textColor
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}