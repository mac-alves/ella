import 'package:ella/app/modules/lists/pages/create/widgets/body.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  final int id;
  const CreatePage({Key key, this.id}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    if (widget.id != null) {
      controller.newMyList = controller.lists.getList(widget.id);
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
                  child: Observer(
                    builder: (_){
                      return Row(
                        children: [
                          Container(
                            width: 120.0,
                            child: Text(
                              'Nova Lista',
                              style: TextStyle(
                                fontSize: 18,
                                color: listsApp.textColor
                              ),
                            ),
                          ),
                        ],
                      );                      
                    },
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
                    controller.setVali(true);

                    if (!controller.listIsValid){
                      return;
                    }

                    if (widget.id == null) {
                      controller.addList(controller.newMyList);
                    } else {
                      controller.updateList(controller.newMyList);
                    }

                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Body(
                  list: controller.newMyList,
                ),
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
          ),
          backgroundColor: listsApp.textColor,
        ),
      ),
    );
  }
}
