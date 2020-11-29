import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/read/widgets/item_list.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
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
    MyListStore list = controller.lists.getList(widget.id);

    return Scaffold(
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:  themeColors.secondary,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeColors.listsColor,
              ), 
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: themeColors.listsColor,
                ), 
                onPressed: () {
                  AlertDialogConfirm(
                    context: context,
                    title: 'Atenção!',
                    description: 'Deseja deletar a lista ${list.name} ?',
                    onPressNot: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    onPressYes: () {
                      controller.removeList(list);
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.of(context).pop();
                    } 
                  ).show();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: themeColors.listsColor,
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
                return SectionTitle(
                  title: list.name,
                );
              },
              childCount: 1,
            )
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
