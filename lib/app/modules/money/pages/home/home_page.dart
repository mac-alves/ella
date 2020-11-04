import 'package:carousel_slider/carousel_slider.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/money_routes.dart';
import 'package:ella/app/modules/money/pages/home/widgets/spent.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'home_controller.dart';
import 'widgets/card_estimate.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor:  themeColors.primary,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.filter_alt,
                  color: themeColors.moneyColor,
                ), 
                onPressed: () {
                  // Navigator.of(context).pushNamed('$LISTS_CREATE/${list.id}');
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Observer(
                    builder: (_) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          height: 180,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          // viewportFraction: 0.9,
                          initialPage: controller.estimates.length - 1,
                          onPageChanged: (index, _) {
                            controller.setCurrentEstimate(index);
                          }
                        ),
                        items: [...List.generate(
                          controller.estimates.length, 
                          (index) {
                            return CardEstimate(
                              estimate: controller.estimates[index]
                            );
                          }
                        )],
                      );
                    }
                  ),
                );
              },
              childCount: 1
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SectionTitle(
                  title: 'Gastos',
                );
              },
              childCount: 1,
            )
          ),
          Observer(
            builder: (_) {
              EstimateStore estimate = controller.currentEstimate;

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var expense = estimate.expenses[index];
                    return Spent(
                      expense: expense,
                    );
                  },
                  childCount: estimate.expenses.length
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
      floatingActionButton: SpeedDial(
        child: Icon(
          Icons.add,
          size: 28,
          color: themeColors.primary,
        ),
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: themeColors.moneyColor,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.shopping_cart
            ),
            backgroundColor: themeColors.moneyColor,
            label: 'Novo Gasto',
            labelStyle: TextStyle(
              fontSize: 15.0
            ),
            onTap: () => print('FIRST CHILD')
          ),
          SpeedDialChild(
            child: Icon(
              Icons.credit_card
            ),
            backgroundColor: themeColors.moneyColor,
            label: 'Novo Orçamento',
            labelStyle: TextStyle(
              fontSize: 15.0
            ),
            onTap: () {
              Navigator.pushNamed(context, MONEY_CREATE_ESTIMATE);
            },
          ),
        ],
      ),
    );
  }
}