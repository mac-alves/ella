import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/read/widgets/item_list.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
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
    // final int id = ModalRoute.of(context).settings.arguments;
    // var list = controller.lists.myLists[id];
    MyListStore list = controller.lists.getList(widget.id);

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
                      Observer(
                        builder: (_){
                          return Container(
                            width: getPropScreenWidth(250),
                            child: Text(
                              list.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: listsApp.textColor
                              ),
                            ),
                          );
                        }
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                            .pushNamed('$LISTS_CREATE/${list.id}');
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
                  onPressed: () {
                    controller.removeList(list);
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                )
              ],
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
          ]
        ),
      ),
    );
  }
}
