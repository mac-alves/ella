import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/pages/home/widgets/flex_app_bar.dart';
import 'package:ella/app/modules/lists/pages/home/widgets/item_list.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 200.0,
              flexibleSpace: LayoutBuilder(
                builder: (context, bc) {
                  //double size = min(bc.constrainHeight(), 120);
                  return FlexibleSpaceBar(
                    background: FlexAppbar(),
                  );
                },
              ),
              // actions: <Widget>[
              //   IconButton(
              //     icon: Icon(
              //       Icons.add,
              //       color: listsApp.iconColor,
              //       size: 33,
              //     ),
              //     tooltip: 'Add new List',
              //     onPressed: (){
              //       Navigator.pushNamed(context, LISTS_CREATE);
              //     },
              //   ),
              // ]
            ),
            Observer(
              builder: (_) {
                return SliverFixedExtentList(
                  itemExtent: 66.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var list = controller.lists.myLists[index];

                      return ItemList(
                        last: (controller.lists.myLists.length == (index + 1)),
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
      ),
      // bottomNavigationBar: CustomNavBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // controller.addListItem(newMyList);
            Navigator.pushNamed(context, LISTS_CREATE);
          },
          child: Icon(
            Icons.add,
            size: 28,
          ),
          backgroundColor: listsApp.textColor,
        ),
    );
  }
}
