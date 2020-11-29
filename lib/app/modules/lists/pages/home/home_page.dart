import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/pages/home/widgets/flex_app_bar.dart';
import 'package:ella/app/modules/lists/pages/home/widgets/item_list.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  // altera a barra de navegação do systema, mas não pegou no meu
  // SystemUiOverlayStyle _currentStyle = SystemUiOverlayStyle.light
  //   .copyWith(systemNavigationBarColor: themeColors.secondary);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Scaffold(
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: themeColors.primary,
            expandedHeight: getPropScreenWidth(210),
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
                  Icons.delete,
                  color: themeColors.listsColor,
                  size: 25,
                ),
                tooltip: 'Delete All Lists',
                onPressed: () {
                  AlertDialogConfirm(
                    context: context,
                    title: 'Atenção!',
                    description: 'Deseja deletar todas as listas ?',
                    onPressNot: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    onPressYes: () {
                      controller.deleteAllLists();
                      Navigator.of(context, rootNavigator: true).pop();
                    } 
                  ).show();
                }
              )
            ]
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SectionTitle(
                  title: 'Suas Listas',
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
                    var list = controller.lists.myLists[index];

                    return ItemList(
                      list: list,
                    );
                  },
                  childCount: controller.lists.myLists.length
                ),
              );
            }
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 40.0
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, LISTS_CREATE);
        },
        child: Icon(
          Icons.add,
          size: 28,
          color: themeColors.primary,
        ),
        backgroundColor: themeColors.listsColor,
      ),
    );
  }
}
