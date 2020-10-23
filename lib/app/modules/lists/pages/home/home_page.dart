import 'dart:math';

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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: listsApp.backColor,
            expandedHeight: getPropScreenWidth(200),
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
                  color: listsApp.iconColor,
                  size: 25,
                ),
                tooltip: 'Delete All Lists',
                onPressed: () => controller.deleteAllLists(),
              )
            ]
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: listsApp.backColor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: listsApp.defaultPadding,
                            right: listsApp.defaultPadding,
                            top: listsApp.defaultPadding,
                            bottom: 10
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              "Suas Listas",
                              style: TextStyle(
                                fontSize: getPropScreenWidth(18),
                                fontWeight: FontWeight.bold,
                                color: listsApp.textColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: listsApp.defaultPadding,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 2,
                            color: listsApp.primaryColor.withOpacity(0.2),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
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
        ),
        backgroundColor: listsApp.textColor,
      ),
    );
  }
}
