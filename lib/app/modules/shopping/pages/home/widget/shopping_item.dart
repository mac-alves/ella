import 'package:ella/app/modules/shopping/models/shopping_store.dart';
import 'package:ella/app/modules/shopping/pages/home/home_controller.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shopping_routes.dart';

class ShoppingItem extends StatefulWidget {

  final ShoppingStore shopping;

  const ShoppingItem({
    Key key,
    @required this.shopping
  }) : super(key: key);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {

  HomeController controller = Modular.get<HomeController>();

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
                color: themeColors.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: !widget.shopping.selected 
                    ? themeColors.tertiary
                    : themeColors.shoppingColor
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
                onLongPress: (){
                  controller.selectToDelete(widget.shopping.id);
                  widget.shopping.setSelected(true);
                },
                onPressed: (){
                  if (!widget.shopping.selected){
                    Navigator.of(context).pushNamed('$SHOPPING_CREATE/${widget.shopping.id}');
                  } else {
                    controller.removeToDelete(widget.shopping.id);
                    widget.shopping.setSelected(false);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: themeColors.shoppingColor,
                      size: 33,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10
                        ),
                        child: Text(
                          widget.shopping.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16,
                            color: themeColors.textPrimary
                          )
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ${widget.shopping.amount}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: themeColors.textPrimary
                      )
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