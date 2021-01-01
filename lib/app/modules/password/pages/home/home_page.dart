import 'package:ella/app/modules/password/pages/home/widget/flex_app_bar.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../password_routes.dart';
import 'home_controller.dart';
import 'widget/password_item.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Scaffold(
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Container(),
            backgroundColor: themeColors.primary,
            expandedHeight: getPropScreenWidth(220),
            flexibleSpace: LayoutBuilder(
              builder: (context, bc) {
                // double size = min(bc.constrainHeight(), 120);
                return FlexibleSpaceBar(
                  background: FlexAppbar(),
                );
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: themeColors.passwordColor,
                  size: 25,
                ),
                tooltip: 'Sair',
                onPressed: () {
                  Navigator.of(context).pop(false);
                  // AlertDialogConfirm(
                  //   context: context,
                  //   title: 'Atenção!',
                  //   description: 'Deseja deletar todas as listas ?',
                  //   onPressNot: () {
                  //     Navigator.of(context, rootNavigator: true).pop();
                  //   },
                  //   onPressYes: () {
                  //     controller.deleteAllLists();
                  //     Navigator.of(context, rootNavigator: true).pop();
                  //   } 
                  // ).show();
                }
              )
            ]
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SectionTitle(
                  title: 'Suas Senhas',
                );
              },
              childCount: 1,
            )
          ),
          Observer(
            builder: (_) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {

                    return PasswordItem();
                  },
                  childCount: 3
                ),
              );
            }
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 47.0
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, PASSWORD_CREATE);
        },
        child: Icon(
          Icons.add,
          size: 28,
          color: themeColors.primary,
        ),
        backgroundColor: themeColors.passwordColor,
      ),
    );
  }
}