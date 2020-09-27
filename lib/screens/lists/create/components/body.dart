import 'package:ella/components/input_text.dart';
import 'package:ella/components/item_list_home.dart';
import 'package:ella/models/Lists.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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

  ItemListHome buildItemList(ListHome list, bool last) {
    return ItemListHome(
      last: last,
      name: list.name,
      icon: list.icon,
      press: list.press,
    );
  }
}