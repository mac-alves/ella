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
            "assets/images/logo-shopping.png",
            height: getPropScreenWidth(140),
            fit: BoxFit.cover
          ),
        ),
        Positioned(
          bottom: 3,
          child: Text(
            'Shopping',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 27,
              color: themeColors.shoppingColor,
              fontWeight: FontWeight.bold,
            )
          ),
        ),
      ],
    );
  }
}