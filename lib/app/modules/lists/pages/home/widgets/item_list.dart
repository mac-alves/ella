import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemList extends StatelessWidget {

  final MyListStore list;

  const ItemList({
    Key key,
    @required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.defaultPadding,
              left: SizeConfig.defaultPadding,
              right: SizeConfig.defaultPadding,
            ),
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: list.concluded ? themeColors.tertiary : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: themeColors.tertiary
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
                onPressed: () {
                  Navigator.of(context).pushNamed('$LISTS_READ/${list.id}');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(
                      list.concluded ? Icons.check_circle : Icons.data_usage,
                      color: themeColors.listsColor,
                      size: 30,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10
                        ),
                        child: Text(
                          list.name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            color: themeColors.textPrimary
                          )
                        ),
                      ),
                    ),
                    Icon(
                      Icons.format_list_bulleted,
                      color: themeColors.textSecondary,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}