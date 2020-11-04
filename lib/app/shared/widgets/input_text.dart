import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
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
        horizontal: SizeConfig.defaultPadding
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
                color: themeColors.textSecondary,
              ),
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: themeColors.tertiary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
              )
            ),
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              controller: controller,
              onChanged: change,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: TextStyle(
                  color: themeColors.textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: SizeConfig.defaultPadding,
                  right: SizeConfig.defaultPadding,
                  top: 3,
                )
              ),
              style: TextStyle(
                fontSize: 15,
                color: themeColors.textPrimary,
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
