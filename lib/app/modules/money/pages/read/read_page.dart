import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/money_routes.dart';
import 'package:ella/app/modules/money/pages/read/widgets/spent.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  bool parseBool(String value){
    if (value != null) {
      return value.toLowerCase() == 'true';
    }

    return false;
  }
  
  @override
  void initState() {
    super.initState();
    controller.setSpents(
      widget.idEstimate,
      widget.typeExpensse,
      parseBool(widget.isFixedGeneral),
      parseBool(widget.isExpectedGeneral)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColors.primary,
      body: CustomScrollView(
        slivers: <Widget>[
          Observer(
            builder: (_){
              return SliverAppBar(
                backgroundColor:  themeColors.secondary,
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
                            widget.typeExpensse
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
                      title: controller.title,
                    );
                  }
                );
              },
              childCount: 1,
            )
          ),
          Observer(
            builder: (_) {
              return SliverFixedExtentList(
                itemExtent: 60.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    SpentStore item = controller.spents[index];

                    return Spent(
                      item: item,
                      isExpectedGeneral: parseBool(widget.isExpectedGeneral),
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
