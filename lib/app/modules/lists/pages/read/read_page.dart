import 'package:ella/app/modules/lists/lists_routes.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/read/widgets/item_list.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
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
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:  themeColors.secondary,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: themeColors.system,
              ), 
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: themeColors.system,
                ), 
                onPressed: () {
                  AlertDialogConfirm(
                    context: context,
                    title: 'Delete',
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
                  color: themeColors.system,
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: SizeConfig.defaultPadding,
                        right: SizeConfig.defaultPadding,
                        top: SizeConfig.defaultPadding,
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
                                color: themeColors.textSecondary,
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.defaultPadding,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 2,
                        color: themeColors.textSecondary.withOpacity(0.1),
                      ),
                    )
                  ],
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
