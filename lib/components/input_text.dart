import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {

  final String label;
  final String placeholder;
  final void Function(String) change;

  const InputText({
    Key key, 
    @required this.label, 
    @required this.change, 
    @required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              onChanged: change,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
