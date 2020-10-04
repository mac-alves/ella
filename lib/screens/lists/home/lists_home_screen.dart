import 'dart:math';

import 'package:ella/widgets/custom_nav_bar.dart';
import 'package:ella/routes/routes.dart';
import 'package:ella/screens/lists/home/widgets/flex_app_bar.dart';
import 'package:ella/screens/lists/home/widgets/item_list.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class ListsHomeScreen extends StatefulWidget {
  const ListsHomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _ListsHomeScreenState createState() => _ListsHomeScreenState();
}

class _ListsHomeScreenState extends State<ListsHomeScreen> {
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
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: listsApp.iconColor,
                    size: 33,
                  ),
                  tooltip: 'Add new List',
                  onPressed: (){
                    Navigator.pushNamed(context, LISTS_CREATE);
                  },
                ),
              ]
            ),
            SliverFixedExtentList(
              itemExtent: 66.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return buildItemList(
                    myLists[index], 
                    (myLists.length == (index + 1)),
                    context
                  );
                },
                childCount: myLists.length 
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  ItemList buildItemList(MyList list, bool last, BuildContext context) {
    return ItemList(
      last: last,
      name: list.name,
      concluded: list.concluded,
      press: () {
        Navigator.pushNamed(
          context, 
          LISTS_READ,
          arguments: list.id
        );
      },
    );
  }
}