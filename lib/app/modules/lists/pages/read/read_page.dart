import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/read/widgets/item_list.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'read_controller.dart';

class ReadPage extends StatefulWidget {
  final int id;
  const ReadPage({Key key, this.id}) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends ModularState<ReadPage, ReadController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    MyListStore list = controller.lists.getList(widget.id);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:  Color(0xFFFFDCA2),
            expandedHeight: 60.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  // color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage("assets/images/back-lists.jpg"),
                    fit: BoxFit.fitWidth, 
                    alignment: Alignment.topLeft
                  ),
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
                onPressed: () {
                  controller.removeList(list);
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: listsApp.iconColor,
                ), 
                onPressed: () {
                  Navigator.of(context).pushNamed('$LISTS_CREATE/${list.id}');
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Color(0xFFFFDCA2),
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
                            child: Observer(
                              builder: (_){
                                return Text(
                                  list.name,
                                  style: TextStyle(
                                    fontSize: getPropScreenWidth(18),
                                    fontWeight: FontWeight.bold,
                                    color: listsApp.textColor,
                                  ),
                                );
                              }
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
              return SliverFixedExtentList(
                itemExtent: 60.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final item = list.items[index];

                    return ItemList(
                      item: item,
                      onPress: () {
                        controller.setChecked(item, list);
                      },
                    );
                  },
                  childCount: list.items.length 
                ),
              );
            }
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0
            ),
          )
        ]
      ),
    );
  }
}
