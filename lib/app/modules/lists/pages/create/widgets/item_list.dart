import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
        left: SizeConfig.defaultPadding,
        right: SizeConfig.defaultPadding,
        bottom: SizeConfig.defaultPadding
      ),
      child: Observer(
        builder: (_){
          return Container(
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: themeColors.tertiary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary,
                width: 0.5
              ),
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
                        color: themeColors.textSecondary,
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        bottom: 5
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: themeColors.textPrimary
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: themeColors.system,
                  ), 
                  onPressed: widget.press
                )
              ],
            ),
          );
        },
      ),
    );
  }
}