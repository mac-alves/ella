import 'package:ella/app/modules/lists/lists_module.dart';
import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/money/money_module.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'start_controller.dart';

class StartPage extends StatefulWidget {
  final String title;
  const StartPage({Key key, this.title = "Start"}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends ModularState<StartPage, StartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        children: [
          RouterOutlet(
            module: ListsModule(),
          ),
          RouterOutlet(
            module: MoneyModule(),
          ),
          Container(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller.pageController,
        builder: (context, snapshot) {
          // return BottomNavigationBar(
          //   currentIndex: controller.pageController?.page?.round() ?? 0,
          //   onTap: (index){
          //     controller.pageController.jumpToPage(index);
          //   },
          //   items: [
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: '',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.settings),
          //       label: 'Config',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.person_outline),
          //       label: 'perfil',
          //     ),
          //   ],
          // );
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
                        controller.pageController.jumpToPage(0);
                      },
                      isActive:
                        controller.pageController?.page?.round() == 0 ||
                        controller.pageController?.page?.round() == null
                    ),
                    NavItem(
                      icon: Icons.attach_money,
                      title: 'Money',
                      color: moneyApp.primaryColor,
                      press: () {
                        controller.pageController.jumpToPage(1);
                      },
                      isActive:
                        controller.pageController?.page?.round() == 1
                    ),
                    NavItem(
                      icon: Icons.lock,
                      title: 'Lists',
                      color: passwordApp.primaryColor,
                      press: () {
                        controller.pageController.jumpToPage(2);
                      },
                      isActive:
                        controller.pageController?.page?.round() == 2
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
      ),
    );
  }
}
