
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final bool hasAction;
  final GestureTapCallback press;

  const SectionTitle({
    Key key, 
    @required this.title, 
    @required this.press,    
    this.hasAction = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 120.0,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: listsApp.textColor
            ),
          ),
        ),
      ],
    );
  }
}