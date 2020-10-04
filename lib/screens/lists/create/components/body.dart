import 'dart:math';

import 'package:ella/components/input_text.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/screens/lists/create/components/item_list.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Random random = new Random();

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
                      label: "Titulo",
                      placeholder: "Titulo da lista",
                      change: (value) {
                        setState(() {
                          listCreate.name = value;
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
                                listCreate.items.add(
                                  new ItemListCreate(
                                    id: random.nextInt(1000000),
                                    name: null,
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
                      height: listCreate.items.length * 55.0,
                      padding: null,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listCreate.items.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            final item = listCreate.items[index];

                            return Dismissible(
                              key: Key(item.id.toString()),
                              onDismissed: (direction) {
                                setState(() {
                                  listCreate.items.remove(item);
                                });
                              },
                              child: ItemList(
                                value: listCreate.items[index].name,
                                change: (value) {
                                  setState(() {
                                    listCreate.items[index].name = value;
                                  });
                                },
                                press: (){
                                  setState(() {
                                    listCreate.items.remove(item);
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