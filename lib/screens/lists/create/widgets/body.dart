import 'dart:math';

import 'package:ella/widgets/input_text.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/screens/lists/create/widgets/item_list.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final MyList newList;

  const Body({
    Key key, 
    @required this.newList,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController myController;
  Random random = new Random();

  @override
  void initState() {
    super.initState();
    myController = TextEditingController();

    if (widget.newList.name != null) {
      myController.text = widget.newList.name;
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
                    InputText(
                      controller: myController,
                      label: "Titulo",
                      placeholder: "Titulo da lista",
                      change: (value) {
                        setState(() {
                          widget.newList.name = value;
                        });
                      }
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 10
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
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.newList.items.add(
                                  new ItemMyList(
                                    id: random.nextInt(1000000),
                                    name: null,
                                    checked: false
                                  )
                                );
                              });
                            },
                            child: Container(
                              alignment: Alignment.centerRight,
                              width: 50,
                              child: Icon(
                                Icons.add,
                                color: listsApp.iconColor,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: widget.newList.items.length * 55.0,
                      padding: null,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.newList.items.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            final item = widget.newList.items[index];

                            return Dismissible(
                              key: Key(item.id.toString()),
                              onDismissed: (direction) {
                                setState(() {
                                  widget.newList.items.remove(item);
                                });
                              },
                              child: ItemList(
                                value: widget.newList.items[index].name,
                                change: (value) {
                                  setState(() {
                                    widget.newList.items[index].name = value;
                                  });
                                },
                                press: (){
                                  setState(() {
                                    widget.newList.items.remove(item);
                                  });
                                },
                              ),
                            );
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VerticalSpacing(of: 20,),
          ],
        ),
      ),
    );
  }
}