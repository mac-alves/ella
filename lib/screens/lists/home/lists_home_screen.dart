import 'dart:math';

import 'package:ella/components/custom_nav_bar.dart';
import 'package:ella/screens/lists/home/components/flex_app_bar.dart';
import 'package:ella/screens/lists/home/components/item_list.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/screens/lists/create/lists_create_screen.dart';
import 'package:ella/screens/lists/read/lists_read_screen.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class ListsHomeScreen extends StatelessWidget {
  const ListsHomeScreen({
    Key key,
  }) : super(key: key);

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
                  double size = min(bc.constrainHeight(), 120);
                  return FlexibleSpaceBar(
                    background: FlexAppbar(),
                  );
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: listsApp.iconColor,
                    size: 33,
                  ),
                  tooltip: 'Add new List',
                  onPressed: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => ListsCreateScreen()
                      ),
                    );
                  },
                ),
              ]
            ),
            SliverFixedExtentList(
              itemExtent: 66.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return buildItemList(
                    listsHome[index], 
                    (listsHome.length == (index + 1)),
                    context
                  );
                },
                childCount: listsHome.length 
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  ItemList buildItemList(ListHome list, bool last, BuildContext context) {
    return ItemList(
      last: last,
      name: list.name,
      icon: list.icon,
      press: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ListsReadScreen()
          ),
        );
      },
    );
  }
}