import 'package:ella/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class InputText extends StatelessWidget {

  final String label;
  final String placeholder;
  final void Function(String) change;
  final String Function() error;
  final TextEditingController controller;

  const InputText({
    Key key, 
    @required this.label, 
    @required this.change, 
    @required this.placeholder, 
    @required this.controller, 
    @required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: listsApp.defaultPadding
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
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: listsApp.primaryColor
              )
            ),
            child: TextField(
              controller: controller,
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
          Observer(
            builder: (_){
              return  Container(
                padding: EdgeInsets.only(
                  left: 5,
                ),
                alignment: Alignment.centerLeft,
                child: error() == null ? null : Text(
                  error(),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.red[600]
                  ),
                ),
                // child: null,
              );
            }
          ),
        ],
      ),
    );
  }
}
