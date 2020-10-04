import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {

  final bool last;
  final String name;
  final bool concluded;
  final GestureTapCallback press;

  const ItemList({
    Key key,
    @required this.concluded, 
    @required this.name, 
    @required this.press, 
    @required this.last,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          left: 32,
          top: 50,
          child: Container(
            width: 4,
            height: last ? 0 : 31,
            decoration: BoxDecoration(
              color: listsApp.primaryColor.withOpacity(0.15),
            )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: listsApp.defaultPadding
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 40,
                height: 56,
                child: Icon(
                  concluded ? Icons.check_circle : Icons.data_usage,
                  color: listsApp.iconColor,
                  size: 30
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: SizedBox(
                  width: 330,
                  height: 56,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(-1, 3),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.16),
                          spreadRadius: -2,
                        ),
                      ],
                    ),
                    child: FlatButton(
                      onPressed: press,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 15,
                              color: listsApp.textColor
                            )
                          ),
                          Spacer(),
                          Icon(
                            Icons.format_list_bulleted,
                            color: listsApp.iconColor,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}