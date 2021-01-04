import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ShoppingItem extends StatefulWidget {

  final String value;

  const ShoppingItem({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {

  MaskedTextController controllerQt;
  TextEditingController controllerName;
  MoneyMaskedTextController controllerValue;

  @override
  void initState() {
    super.initState();
    controllerQt = new MaskedTextController(
      mask: '000'
    );

    controllerName = TextEditingController();

    controllerValue = new MoneyMaskedTextController(
      decimalSeparator: '.',
      thousandSeparator: ',',
      precision: 2,
      leftSymbol: 'R\$ ',
    );

    controllerQt.text = null /* widget.value */;
    controllerName.text = null /* widget.value */;
    controllerValue.text = null /* widget.value */;
  }

  @override
  void dispose() {
    super.dispose();
    
    if (controllerQt.dispose != null){
      controllerQt.dispose();
    }

    if (controllerName.dispose != null){
      controllerName.dispose();
    }

    if (controllerValue.dispose != null){
      controllerQt.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.defaultPadding,
        right: SizeConfig.defaultPadding,
        bottom: SizeConfig.defaultPadding
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: SizeConfig.defaultPadding
            ),
            child: Container(
              width: getPropScreenWidth(70) - SizeConfig.defaultPadding,
              height: 45,
              decoration: BoxDecoration(
                color: themeColors.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: themeColors.textSecondary,
                  width: 0.5
                ),
              ),
              child: TextField(
                controller: controllerQt,
                keyboardType: TextInputType.number,
                onChanged: (value){},
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'Qt',
                  hintStyle: TextStyle(
                    color: themeColors.textSecondary,
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 10,
                    right: 9,
                    bottom: 5
                  ),
                ),
                style: TextStyle(
                  fontSize: 14,
                  color: themeColors.textPrimary
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: SizeConfig.defaultPadding
              ),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  color: themeColors.tertiary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: themeColors.textSecondary,
                    width: 0.5
                  ),
                ),
                child: TextField(
                  controller: controllerName,
                  onChanged: (value){},
                  decoration: InputDecoration(
                    hintText: 'Nome do produto',
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
            ),
          ),
          Container(
            width: getPropScreenWidth(95),
            height: 45,
            decoration: BoxDecoration(
              color: themeColors.tertiary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary,
                width: 0.5
              ),
            ),
            child: TextField(
              controller: controllerValue,
              onChanged: (value){},
              textAlign: TextAlign.right,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'valor',
                hintStyle: TextStyle(
                  color: themeColors.textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 5
                ),
              ),
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textPrimary
              ),
            ),
          ),
        ],
      ),
    );
  }
}