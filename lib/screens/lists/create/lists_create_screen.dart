import 'dart:math';

import 'package:ella/widgets/custom_nav_bar.dart';
import 'package:ella/widgets/section_title.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class ListsCreateScreen extends StatefulWidget {
  @override
  _ListsCreateScreenState createState() => _ListsCreateScreenState();
}

class _ListsCreateScreenState extends State<ListsCreateScreen> {

  MyList newMyList;

  @override
  void initState() {
    super.initState();

    newMyList = new MyList(
      id: myLists.length,
      name: null,
      concluded: false, 
      items: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final int id = ModalRoute.of(context).settings.arguments;

    if (id != null) {
      newMyList = myLists[id];
    }
        
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/back.png"),
          fit: BoxFit.fill, 
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 100.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: getPropScreenWidth(listsApp.defaultPadding),
                      vertical: 10
                    ),
                    child: SectionTitle(
                      press: () {},
                      title: "Nova Lista",
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: listsApp.iconColor,
                  ), 
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.save,
                      color: listsApp.iconColor,
                    ), 
                    onPressed: () {
                      setState(() {
                        myLists.add(newMyList);
                      });
                    },
                  )
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Body(
                    newList: newMyList,
                  ),
                  childCount: 1,
                ),
              ),
            ]
          ),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}