import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyInput extends StatelessWidget {

  final String label;
  final String placeholder;
  final GestureTapCallback press;

  const MoneyInput({
    Key key, 
    @required this.label, 
    @required this.press, 
    @required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = new MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

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
              label,
              style: TextStyle(
                fontSize: 14,
                color: listsApp.textColor
              ),
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: listsApp.primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: listsApp.textColor,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 18
                )
              ),
              style: TextStyle(
                fontSize: 14,
                color: listsApp.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}