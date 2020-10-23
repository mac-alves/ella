import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemList extends StatelessWidget {
  
  final MyListItemStore item;
  final Function onPress;

  const ItemList({
    Key key, 
    @required this.item, 
    @required this.onPress, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: listsApp.defaultPadding,
            right: listsApp.defaultPadding,
            top: listsApp.defaultPadding
          ),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: item.checked ? Color(0xFFFFF1E2) : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: listsApp.primaryColor.withOpacity(0.56)
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.16),
                ),
              ],
            ),
            child: FlatButton(
              onPressed: onPress,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 10
                    ),
                    child: Icon(
                      item.checked ? Icons.check : Icons.crop_din,
                      color: (item.checked) ? 
                        listsApp.iconColor.withOpacity(0.6) : listsApp.iconColor,
                      size: 25,
                    ),
                  ),
                  Text(
                    item.name != null ? item.name : '',
                    style: TextStyle(
                      decoration: (item.checked) ? TextDecoration.lineThrough : null,
                      fontSize: 15,
                      color: (item.checked) ? 
                        listsApp.textColor.withOpacity(0.6) : listsApp.textColor
                    )
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}