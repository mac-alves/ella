import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/shared/widgets/nav_item.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);

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
                  if ((route != null) && (route.settings.name != LISTS_HOME)) {
                    Navigator.pushNamed(context, LISTS_HOME);
                    // Modular.to.pushNamed(LISTS_HOME);
                  }
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