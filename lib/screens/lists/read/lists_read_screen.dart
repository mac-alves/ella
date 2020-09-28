import 'package:ella/components/custom_nav_bar.dart';
import 'package:ella/components/section_title.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/screens/lists/create/lists_create_screen.dart';
import 'package:ella/screens/lists/read/components/item_list.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class ListsReadScreen extends StatefulWidget {
  const ListsReadScreen({
    Key key,
  }) : super(key: key);

  @override
  _ListsReadScreenState createState() => _ListsReadScreenState();
}

class _ListsReadScreenState extends State<ListsReadScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child: Row(
                    children: [
                      SectionTitle(
                        press: () {},
                        title: listRead.name,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => ListsCreateScreen()
                            ),
                          );
                        },
                        child: Container(
                          child: Icon(
                            Icons.edit,
                            color: listsApp.iconColor,
                            size: 23,
                          ),
                        ),
                      )
                    ],
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
                    Icons.delete,
                    color: listsApp.iconColor,
                  ), 
                  onPressed: () {},
                )
              ],
            ),
            SliverFixedExtentList(
              itemExtent: 60.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final item = listRead.items[index];

                  return ItemList(
                    id: item.id,
                    name: item.name,
                    checked: item.checked,
                    press: () {
                      setState((){
                        listRead.items[index].checked = !listRead.items[index].checked;
                      });
                    }
                  );
                },
                childCount: listRead.items.length 
              ),
            ),
          ]
        ),
        bottomNavigationBar: CustomNavBar(),
      ),
    );
  }
}