import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemList extends StatelessWidget {

  final MyListStore list;
  final bool last;

  const ItemList({
    Key key,
    @required this.last, 
    @required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
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
                      list.concluded ? Icons.check_circle : Icons.data_usage,
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
                          onPressed: () {
                            Navigator.of(context).pushNamed('$LISTS_READ/${list.id}');
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Text(
                                list.name,
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
            ),
          ],
        );
      },
    );
  }
}