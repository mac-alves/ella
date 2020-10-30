import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppbar extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: getPropScreenWidth(140),
          fit: BoxFit.cover
        ),
        Positioned(
          bottom: 5,
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