import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_routes.dart';
import 'package:ella/app/modules/money/pages/read/widgets/spent.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/enum_states.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'read_controller.dart';

class ReadPage extends StatefulWidget {
  
  final int idEstimate;
  final String typeExpensse;
  final String isFixedGeneral; 
  final String isExpectedGeneral; 

  const ReadPage({
    Key key, 
    this.idEstimate, 
    this.typeExpensse,
    this.isFixedGeneral,
    this.isExpectedGeneral,
  }) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends ModularState<ReadPage, ReadController> {
  //use 'controller' variable to access controller

  ReactionDisposer whenDispose;

  bool parseBool(String value){
    if (value != null) {
      return value.toLowerCase() == 'true';
    }

    return false;
  }
  
  @override
  void initState() {
    super.initState();

    whenDispose = when(
      (r) => controller.currentState == States.SUCESS, 
      () => controller.setSpents(
        widget.idEstimate,
        widget.typeExpensse,
        parseBool(widget.isFixedGeneral),
        parseBool(widget.isExpectedGeneral)
      )
    );
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
    return Scaffold(
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          Observer(
            builder: (_){
              String qtItems = controller.listSpentToDelete.length == 0 
                ? ''
                : '${controller.listSpentToDelete.length}';
                
              return SliverAppBar(
                backgroundColor:  themeColors.secondary,
                title: Text(
                  (qtItems != '') 
                    ? 'Selecionados: $qtItems'
                    : '',
                  style: TextStyle(
                    color: themeColors.textPrimary,
                    fontSize: 17
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: themeColors.moneyColor,
                  ), 
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: !controller.isDelete ? [] : [
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: themeColors.moneyColor,
                    ), 
                    onPressed: () {
                      AlertDialogConfirm(
                        context: context,
                        title: 'Atenção!',
                        description: 'Deseja deletar os gastos selecionados ?',
                        onPressNot: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        onPressYes: () {
                          controller.deleteSpentSelecteds(
                            widget.idEstimate,
                            widget.typeExpensse,
                            parseBool(widget.isFixedGeneral),
                            parseBool(widget.isExpectedGeneral)
                          );
                          Navigator.of(context, rootNavigator: true).pop();
                        } 
                      ).show();
                    },
                  )
                ],
              );
            }
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Observer(
                  builder: (_){
                    return SectionTitle(
                      title: controller.title == null 
                      ? '' 
                      : controller.title,
                    );
                  }
                );
              },
              childCount: 1,
            )
          ),
          Observer(
            builder: (_) {

              if (controller.currentState == States.LOADING) {
                return SliverFixedExtentList(
                  itemExtent: 100.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                themeColors.moneyColor
                              ),
                            )
                          ), 
                        ]
                      );
                    },
                    childCount: 1
                  ),
                );
              }

              return SliverFixedExtentList(
                itemExtent: 60.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    SpentStore item = controller.spents[index];

                    return Spent(
                      item: item,
                      isExpectedGeneral: parseBool(widget.isExpectedGeneral),
                      isFixedEstimate: 
                        widget.typeExpensse.toString() == getIndexFromType(TypeExpense.FIXED),
                      onPress: (String value) {
                        String id = widget.idEstimate.toString();
                        String type = widget.typeExpensse.toString();
                        String idSpent = item.id.toString();

                        String path = "$MONEY_CREATE_SPENT/estimate/$id/$type/$idSpent";

                        if (parseBool(widget.isFixedGeneral)) {
                          path = '$MONEY_CREATE_SPENT/fixed/$idSpent';
                        }

                        if (parseBool(widget.isExpectedGeneral)) {
                          path = '$MONEY_CREATE_SPENT/expected/$idSpent';
                        }

                        controller.goScreenEdit(
                          context,
                          path,
                          widget.idEstimate, 
                          widget.typeExpensse, 
                          parseBool(widget.isFixedGeneral),
                          parseBool(widget.isExpectedGeneral)
                        );
                      },
                    );
                  },
                  childCount: controller.spents.length 
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
    );
  }
}
