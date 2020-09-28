import 'package:ella/components/nav_item.dart';
import 'package:ella/screens/lists/home/lists_home_screen.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(listsApp.defaultPadding),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.format_list_bulleted,
                title: 'Lists',
                color: listsApp.primaryColor,
                press: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ListsHomeScreen()
                    ),
                  );
                },
                isActive: true,
              ),
              NavItem(
                icon: Icons.attach_money,
                title: 'Money',
                color: moneyApp.primaryColor,
                press: () {},
              ),
              NavItem(
                icon: Icons.lock,
                title: 'Lists',
                color: passwordApp.primaryColor,
                press: () {},
              ),
              NavItem(
                icon: Icons.settings,
                title: 'Setting',
                color: def.primaryColor,
                press: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}