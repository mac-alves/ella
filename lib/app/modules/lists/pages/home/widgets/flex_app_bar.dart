import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppbar extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/back-lists.jpg"),
          fit: BoxFit.fill, 
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 40),
          Text(
            "Lists",
            style: TextStyle(
              fontSize: getPropScreenWidth(55),
              fontWeight: FontWeight.bold,
              color: listsApp.textColor,
              height: 0.5
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 4
            ),
            child: Text(
              "Seu sistema de controle \ne armazenamento de listas rapidas",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getPropScreenWidth(13),
                color: Colors.white,
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}