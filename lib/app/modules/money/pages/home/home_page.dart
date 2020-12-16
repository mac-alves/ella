import 'package:carousel_slider/carousel_slider.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_routes.dart';
import 'package:ella/app/modules/money/pages/home/widgets/filter_dialog.dart';
import 'package:ella/app/modules/money/pages/home/widgets/spent.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:ella/app/shared/widgets/drop_down_select.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'home_controller.dart';
import 'widgets/card_estimate.dart';
import 'widgets/menu_popup.dart';
import 'package:permission_handler/permission_handler.dart';

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
            leading: Observer(
              builder: (_) {
                return Visibility(
                  visible: controller.isFilter,
                  child: IconButton(
                    icon: Icon(
                      Icons.not_interested,
                      color: themeColors.moneyColor,
                    ), 
                    onPressed: () => controller.clearFilter(),
                  ),
                );
              }
            ),
            actions: [
              Observer(
                builder: (_) {
                  return Visibility(
                    visible: !controller.isNotEstimate,
                    child: IconButton(
                      icon: Icon(
                        Icons.download_sharp,
                        color: themeColors.moneyColor,
                      ), 
                      onPressed: () async {
                        final permission = await Permission.storage.request();

                        if (permission.isGranted){
                          bool sucess = await controller.downloadData();
                          String msg = 'Arquivo salvo em Downloads.';

                          if (!sucess){
                            msg = 'Erro ao salvar dados em arquivo local!';
                          }

                          SnackMesage(context).show('$msg');
                        } else {
                          print('permission deined');
                        }
                      },
                    ),
                  );
                }
              ),
              PopupMenuButton<String>(
                captureInheritedThemes: true,
                color: themeColors.secondary,
                icon: Icon(
                  Icons.more_vert,
                  color: themeColors.moneyColor,
                ),
                onSelected: (String item){
                  if (menuItemsToEnum[item] == MenuPopup.FILTRO) {
                    FilterDialog(
                      context: context,
                      content: [
                        Observer(
                          builder: (_) {
                            return DropDownSelect(
                              label: 'Mês referente',
                              placeholder: 'Selecione um mês',
                              msgError: 'Mês não selecionado',
                              change: controller.setSelectedMothFilter,
                              value: controller.selectedMothFilter,
                              itens: controller.money.idsEstimates,
                            );
                          }
                        ),
                      ],
                      onPressCancel: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      onPressFilter: () {
                        controller.setFilter();
                        Navigator.of(context, rootNavigator: true).pop();
                      } 
                    ).show();
                  }

                  if (menuItemsToEnum[item] == MenuPopup.EDITAR) {
                    controller.goScreen(
                      context, 
                      '$MONEY_CREATE_ESTIMATE/${controller.currentEstimate.id}'
                    );
                  }

                  if (menuItemsToEnum[item] == MenuPopup.DELETE) {
                    AlertDialogConfirm(
                      context: context,
                      title: 'Atenção!',
                      description: 
                        'Deseja mesmo deletar o orçamento "${controller.currentEstimate.month}"',
                      onPressNot: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      onPressYes: () async {
                        await controller.deleteCurrentEstimate();
                        Navigator.of(context, rootNavigator: true).pop();
                      } 
                    ).show();
                  }

                  if (menuItemsToEnum[item] == MenuPopup.FIXOS) {
                    controller.goScreen(context, '$MONEY_READ/fixed');
                  }

                  if (menuItemsToEnum[item] == MenuPopup.PREVISTOS) {
                    controller.goScreen(context, '$MONEY_READ/expected');
                  }
                },
                itemBuilder: (BuildContext context) {
                  Map<MenuPopup, String> itens = controller.isNotEstimate 
                    ? enumToMenuItemNotFound
                    : enumToMenuItem;

                  return itens.values.toList().map((String choice){
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: TextStyle(
                          color: themeColors.textPrimary
                        )
                      ),
                    );
                  }).toList();
                }
              )
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 5.0
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Observer(
                    builder: (_) {
                      return CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                          height: 180,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          // viewportFraction: 0.9,
                          initialPage: controller.initialPage,
                          onPageChanged: (index, _) {
                            controller.setCurrentEstimate(index);
                          },
                        ),
                        items: [...List.generate(
                          controller.estimates.length, 
                          (index) {
                            return CardEstimate(
                              estimate: controller.estimates[index],
                              notFound: controller.isNotEstimate
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
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    EstimateStore currentEstimate = controller.currentEstimate;
                    
                    if (currentEstimate == null) {
                      return Container();
                    }

                    ExpenseStore expense = currentEstimate.expenses[index];

                    return Spent(
                      expense: expense,
                      onPress: (){
                        if (!controller.isNotEstimate) {
                          controller.goScreen(
                            context,
                            '$MONEY_READ/${currentEstimate.id}/${getIndexFromType(expense.type)}'
                          );
                        }
                      },
                    );
                  },
                  childCount: controller.currentEstimate != null 
                    ? controller.currentEstimate.expenses.length
                    : 0
                ),
              );
            }
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 60.0
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
            onTap: () {
              String path = '$MONEY_CREATE_SPENT/${controller.currentEstimate.id}';
              
              if (controller.isNotEstimate) {
                path = '$MONEY_CREATE_SPENT/${controller.currentEstimate.id}/notEstimate';
              }

              controller.goScreen(context, path);
            }
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
              controller.goScreen(
                context, 
                MONEY_CREATE_ESTIMATE
              );
            },
          ),
        ],
      ),
    );
  }
}