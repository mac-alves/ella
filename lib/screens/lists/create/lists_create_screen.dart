import 'package:ella/components/custom_nav_bar.dart';
import 'package:ella/components/section_title.dart';
import 'package:ella/screens/lists/create/components/body.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class ListsCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
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
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Body(),
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