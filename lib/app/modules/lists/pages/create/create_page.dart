import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/create/widgets/body.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
                                    "Nova Lista",
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
                            padding: EdgeInsets.only(
                              left: listsApp.defaultPadding,
                              right: listsApp.defaultPadding,
                              bottom: listsApp.defaultPadding
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
      );
  }
}
