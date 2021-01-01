import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppbar extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: AppBar().preferredSize.height + 5
          ),
          child: Image.asset(
            "assets/images/logo-lists.png",
            height: getPropScreenWidth(140),
            fit: BoxFit.cover
          ),
        ),
        Positioned(
          bottom: 10,
          child: Text(
            "Seu sistema de controle\ne armazenamento de listas rapidas",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getPropScreenWidth(12),
              color: themeColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}