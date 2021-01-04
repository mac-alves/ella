import 'package:ella/app/modules/shopping/pages/home/widget/flex_app_bar.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shopping_routes.dart';
import 'home_controller.dart';
import 'widget/shopping_item.dart';

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
          Observer(
            builder: (_){
              return SliverAppBar(
                leading: Container(),
                backgroundColor: themeColors.primary,
                expandedHeight: getPropScreenWidth(225),
                flexibleSpace: LayoutBuilder(
                  builder: (context, bc) {
                    // double size = min(bc.constrainHeight(), 120);
                    return FlexibleSpaceBar(
                      background: FlexAppbar(),
                    );
                  },
                ),
                actions: <Widget>[
                  Visibility(
                    visible: controller.isDelete,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: themeColors.passwordColor,
                      ), 
                      onPressed: () {
                        AlertDialogConfirm(
                          context: context,
                          title: 'Atenção!',
                          description: 'Deseja deletar as compras selecionadas ?',
                          onPressNot: () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                          onPressYes: () {
                            controller.deletePasswordsSelecteds();
                            Navigator.of(context, rootNavigator: true).pop();
                          } 
                        ).show();
                      },
                    ),
                  ),
                ]
              );
            }
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SectionTitle(
                  title: 'Suas Compras',
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

                    return ShoppingItem();
                  },
                  childCount: 1
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
          Navigator.pushNamed(context, SHOPPING_CREATE);
        },
        child: Icon(
          Icons.add,
          size: 28,
          color: themeColors.primary,
        ),
        backgroundColor: themeColors.shoppingColor,
      ),
    );
  }
}
