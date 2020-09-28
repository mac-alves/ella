import 'package:ella/components/input_text.dart';
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
  List<int> itens = [];

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
                      press: () {}
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
                                itens.add(itens.length + 1);
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
                      height: itens.length * 55.0,
                      padding: null,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: itens.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            final item = itens[index];
                            return Dismissible(
                              key: Key(item.toString()),
                              onDismissed: (direction) {
                                setState(() {
                                  itens.removeAt(index);
                                });
                              },
                              child: ItemList(
                                index: index,
                                press: (){
                                    setState(() {
                                    itens.removeAt(index);
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