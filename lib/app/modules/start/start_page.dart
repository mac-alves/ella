import 'package:ella/app/modules/lists/lists_module.dart';
import 'package:ella/app/modules/money/money_module.dart';
import 'package:ella/app/modules/password/password_module.dart';
import 'package:ella/app/modules/shopping/shopping_module.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
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
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          RouterOutlet(
            module: ListsModule(),
          ),
          RouterOutlet(
            module: MoneyModule(),
          ),
          RouterOutlet(
            module: PasswordModule(),
          ),
          RouterOutlet(
            module: ShoppingModule(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: getPropScreenWidth(55),
        child: AnimatedBuilder(
          animation: controller.pageController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              backgroundColor: themeColors.secondary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 30,
              selectedFontSize: 0,
              selectedIconTheme: IconThemeData(
                color: themeColors.textPrimary,
              ),
              unselectedIconTheme: IconThemeData(
                color: themeColors.textSecondary.withOpacity(0.5),
              ),
              currentIndex: controller.pageController?.page?.round() ?? 0,
              onTap: (index){
                controller.pageController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.format_list_bulleted),
                  label: '',
                  backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.attach_money),
                  label: '',
                  backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.lock_outlined),
                  label: '',
                  backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: '',
                  backgroundColor: Colors.black
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
