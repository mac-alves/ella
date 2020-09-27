
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {

  final String title;
  final GestureTapCallback press;

  const SectionTitle({
    Key key, 
    @required this.title, 
    @required this.press,    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: listsApp.textColor
          ),
        ),
        Spacer(),
        // GestureDetector(
        //   onTap: press,
        //   child: Text(
        //     "See All",
        //     style: TextStyle(
        //       color: listsApp.textColor
        //     )
        //   ),
        // ),
      ],
    );
  }
}