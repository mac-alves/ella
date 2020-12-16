import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'spent_controller.dart';
import 'widgets/spent_fields.dart';

class SpentPage extends StatefulWidget {
  
  final int idEstimate;
  final String idSpent;
  final String typeExpense;
  final String isFixedGeneral;
  final String isExpectedGeneral;
  final bool notEstimate;
  
  const SpentPage({
    Key key, 
    this.idEstimate, 
    this.idSpent, 
    this.typeExpense,
    this.isFixedGeneral,
    this.isExpectedGeneral,
    this.notEstimate = false,
  }) : super(key: key);

  @override
  _SpentPageState createState() => _SpentPageState();
}

class _SpentPageState extends ModularState<SpentPage, SpentController> {
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
    // print(widget.idEstimate.toString());
    if (widget.notEstimate) {
      controller.setEnableExpectedGeneral(true);
      controller.setNotEstimate(widget.notEstimate);
    }

    controller.setIdEstimate(widget.idEstimate.toString());

    controller.setNewSpent(
      new SpentStore(
        id: '0',
        title: null,
        value: null,
        selected: true,
        date: DateFormat('yyyy/MM/dd').format(DateTime.now())
      )
    );
    
    if (parseBool(widget.isFixedGeneral)) {
      SpentStore spent = controller.prepareSpentToEdit(
        typeExpense: TypeExpense.FIXED.index.toString(),
        idSpent: widget.idSpent,
        isFixedGeneral: true
      );
      controller.setNewSpent(spent);
      return;
    }

    if (parseBool(widget.isExpectedGeneral)) {
      SpentStore spent = controller.prepareSpentToEdit(
        typeExpense: TypeExpense.EXPECTED.index.toString(),
        idSpent: widget.idSpent,
        isExpectedGeneral: true
      );
      controller.setNewSpent(spent);
      return;
    }

    if (widget.idSpent != null && widget.typeExpense != null) {
      SpentStore spent = controller.prepareSpentToEdit(
        typeExpense: widget.typeExpense,
        idSpent: widget.idSpent
      );
      controller.setNewSpent(spent);
    } else {
      whenDispose = when(
        (r) => controller.idNewSpent != null, 
        () => controller.newSpent.setId(controller.idNewSpent.toString())
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
      body: CustomScrollView(
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
              IconButton(
                icon: Icon(
                  Icons.save,
                  color: themeColors.moneyColor,
                ), 
                onPressed: () {
                  if (controller.validateSpent()) {
                    String message = 'Gasto criado com sucesso.';

                    if (
                      (widget.idSpent != null && widget.typeExpense != null) ||
                      parseBool(widget.isFixedGeneral) ||
                      parseBool(widget.isExpectedGeneral)) {

                      controller.updateEstimate(
                        widget.typeExpense, 
                        widget.idSpent
                      );
                      message = 'Gasto atualizado com sucesso.';
                    } else {
                      controller.createSpent();
                    }

                    SnackMesage(context).show('$message');
                    Navigator.of(context).pop(false);
                  }
                },
              )
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SpentFields(),
              childCount: 1,
            ),
          ),
        ]
      ),
    );
  }
}
