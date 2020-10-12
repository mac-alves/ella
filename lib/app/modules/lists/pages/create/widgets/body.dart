import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/create/create_controller.dart';
import 'package:ella/app/modules/lists/pages/create/widgets/item_list.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Body extends StatefulWidget {
  final MyListStore list;

  const Body({
    Key key, 
    @required this.list,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends ModularState<Body, CreateController> {
  TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();

    if (widget.list.name != null) {
      myController.text = widget.list.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.05)
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.16),
                      spreadRadius: -2,
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Observer(
                      builder: (_){
                        return InputText(
                          controller: myController,
                          label: "Titulo",
                          placeholder: "Titulo da lista",
                          change: widget.list.setName,
                          error: controller.validateNameList,
                        );
                      }
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Itens",
                            style: TextStyle(
                              fontSize: 14,
                              color: listsApp.textColor
                            )
                          ),
                          Spacer(),
                          Observer(
                            builder: (_){
                              return Container(
                                child: controller.validateAllItemsList() == null ? null : Text(
                                  controller.validateAllItemsList(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red[600]
                                  ),
                                ),
                              );
                            }
                          ),
                        ],
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return Container(
                          alignment: Alignment.center,
                          height: widget.list.items != null ? widget.list.items.length * 55.0 : 0,
                          padding: null,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.list.items != null ? widget.list.items.length : 0,
                              itemBuilder: (BuildContext ctxt, int index) {
                                final item = widget.list.items[index];

                                return Dismissible(
                                  key: Key(item.id.toString()),
                                  onDismissed: (direction) =>
                                    controller.removeListItem(widget.list, item),
                                  child: ItemList(
                                    value: item.name,
                                    change: item.setName,
                                    press: () => 
                                      controller.removeListItem(widget.list, item),
                                  ),
                                );
                              }
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacing(of: 100,),
          ],
        ),
      ),
    );
  }
}