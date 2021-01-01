import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppbar extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: AppBar().preferredSize.height * 1.7,
        left: SizeConfig.defaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Password",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 30,
              color: themeColors.passwordColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Seu sistema de controle\ne armazenamento de senhas",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: getPropScreenWidth(12),
              color: themeColors.textSecondary,
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 5,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeColors.passwordColor,
            ),
          )
        ],
      ),
    );
  }
}