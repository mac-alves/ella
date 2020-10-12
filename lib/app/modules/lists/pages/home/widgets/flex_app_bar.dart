import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class FlexAppbar extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lists",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: listsApp.textColor,
            ),
          ),
          Text(
            "Sistema de criação de\nlistas rapidas.",
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Container(
              width: 52,
              height: 5,
              decoration: BoxDecoration(
                color: listsApp.textColor,
                borderRadius: BorderRadius.circular(3)
              ),
            ),
          ),
          VerticalSpacing(of: 15,),
          SectionTitle(
            title: "Suas listas",
            press: () {}
          ),
          VerticalSpacing(of: 10,),
        ],
      ),
    );
  }
}