import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/create/widgets/body.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  final int id;
  const CreatePage({Key key, this.id}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller
  
  ReactionDisposer whenDispose;

  @override
  void initState() {
    super.initState();
    controller.setNewMyList(new MyListStore(id: null, name: null, concluded: false));

    if (widget.id != null) {
      controller.setNewMyList(controller.lists.getList(widget.id));
    } else {
      whenDispose = when(
        (r) => controller.idNewList != null, 
        () => controller.newMyList.setId(controller.idNewList)
      );
    }
  }
  
  @override
  void dispose() {
    super.dispose();
    if (whenDispose != null) {
      whenDispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

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
                    Icons.save,
                    color: themeColors.listsColor,
                  ), 
                  onPressed: () {
                    if (controller.listIsValid()){

                      String message = 'Lista criada com sucesso.';

                      if (widget.id == null) {
                        controller.addList(controller.newMyList);
                      } else {
                        controller.updateList(controller.newMyList);
                        message = 'Lista atualizada com sucesso.';
                      }

                      SnackMesage(context).show('$message');
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SectionTitle(
                    title: 'Nova Lista',
                  );
                },
                childCount: 1,
              )
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Body(),
                childCount: 1,
              ),
            ),
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addListItem(controller.newMyList);
          },
          child: Icon(
            Icons.add,
            size: 28,
            color: themeColors.primary,
          ),
          backgroundColor: themeColors.listsColor,
        ),
      );
  }
}
