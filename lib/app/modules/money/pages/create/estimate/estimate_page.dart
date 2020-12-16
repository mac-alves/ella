import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/shared/utils/alert_dialog_confirm.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'estimate_controller.dart';
import 'widgets/estimate_fields.dart';
import 'widgets/fixed_expenses.dart';
import 'widgets/expected_expenses.dart';

class EstimatePage extends StatefulWidget {
  final int id;
  const EstimatePage({Key key, this.id}) : super(key: key);

  @override
  _EstimatePageState createState() => _EstimatePageState();
}

class _EstimatePageState
    extends ModularState<EstimatePage, EstimateController> {
  //use 'controller' variable to access controller

  ReactionDisposer whenDispose;

  @override
  void initState() {
    super.initState();

    controller.setNewEstimate(
      new EstimateStore(
        id: 0,
        month: null,
        startDay: null,
        endDay: null,
        salary: null,
        openingBalance: null,
        finalBalance: null,
      )
    );

    if (widget.id != null) {
      controller.setIsEdit(true);

      EstimateStore estimate = controller
        .prepareEstimateEdit(controller.money.getEstimate(widget.id));

      controller.setNewEstimate(estimate);
    } else {
      controller.setExpenses();
      whenDispose = when(
        (r) => controller.idNewEstimate != null, 
        () => controller.newEstimate.setId(controller.idNewEstimate)
      );
    }
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
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: themeColors.primary,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
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
              actions: [
                Visibility(
                  visible: controller.isEdit,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: themeColors.moneyColor,
                    ), 
                    onPressed: () {
                      AlertDialogConfirm(
                        context: context,
                        title: 'Atenção!',
                        description: 'Deseja deletar este orçamento ?',
                        onPressNot: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        onPressYes: () {
                          controller.deleteEstimate();
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.of(context).pop(false);
                        } 
                      ).show();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: themeColors.moneyColor,
                  ), 
                  onPressed: () {
                    if (controller.validateEstimate()) {
                      String message = 'Orçamento criado com sucesso.';
                      bool create = true;

                      if (widget.id == null) {
                        controller.createEstimate();
                      } else {
                        controller.updateEstimate();
                        message = 'Orçamento atualizado com sucesso.';
                        create = false;
                      }
                      
                      SnackMesage(context).show('$message');
                      Navigator.of(context).pop(create);
                    }
                  },
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => EstimateFields(),
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => FixedExpenses(),
                childCount: 1,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ExpectedExpenses(
                  enableSaving: false,
                  changeEnableSaving: (value){},
                ),
                childCount: 1,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 10.0
              ),
            )
          ]
        ),
      ),
    );
  }
}
