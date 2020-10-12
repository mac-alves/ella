import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isActive;
  final GestureTapCallback press;

  const NavItem({
    Key key, 
    @required this.title, 
    @required this.icon, 
    @required this.press, 
    @required this.color,
    this.isActive = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        height: getPropScreenWidth(60),
        width: getPropScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isActive) listsApp.shadow]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: (isActive) ? color : color.withOpacity(0.3),
            ),
            // Spacer(),
            // Text(
            //   title,
            //   style: TextStyle(
            //     fontSize: 11,
            //     fontWeight: FontWeight.bold,
            //     color: (isActive) ? color : color.withOpacity(0.3),
            //   )
            // )
          ],
        ),
      ),
    );
  }
}