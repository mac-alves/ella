import 'package:ella/components/date_picker.dart';
import 'package:ella/components/drop_down_select.dart';
import 'package:ella/components/input_text.dart';
import 'package:ella/components/money_input.dart';
import 'package:ella/components/secure_input.dart';
import 'package:ella/utils/constants.dart';
import 'package:ella/utils/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
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
        // extendBodyBehindAppBar: true,
        appBar: buildAppBar(),
        body: GestureDetector(
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
                          change: (value) {}
                        ),
                        VerticalSpacing(of: 5,),
                        DropDownSelect(),
                        VerticalSpacing(of: 5,),
                        DatePicker(),
                        VerticalSpacing(of: 5,),
                        MoneyInput(
                          label: "Valor",
                          placeholder: "Valor do gasto",
                          press: () {}
                        ),
                        VerticalSpacing(of: 5,),
                        SecureInput(
                          label: "Senha",
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
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: listsApp.iconColor,
        ), 
        onPressed: () {},
      )
    );
  }
}