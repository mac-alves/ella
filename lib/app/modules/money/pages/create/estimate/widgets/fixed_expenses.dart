import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../estimate_controller.dart';

class FixedExpenses extends StatefulWidget {
  @override
  _FixedExpensesState createState() => _FixedExpensesState();
}

class _FixedExpensesState extends State<FixedExpenses> {  
  
  EstimateController controller = Modular.get<EstimateController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: 
            controller.isEdit && 
            controller.fixedExpensesOfEstimate.length > 0,
          child: Column(
            children: [
              VerticalSpacing(of:10),
              SectionTitle(
                title: 'Gastos Fixos Deste Orçamento',
              ),
              ...List.generate(controller.fixedExpensesOfEstimate.length, (i) {
                SpentStore item = controller.fixedExpensesOfEstimate[i];
                
                return FixedExpenseItem(
                  spent: item,
                  notEnable: true,
                );
              })
            ],
          ),
        ),
        VerticalSpacing(of:10),
        SectionTitle(
          title: 'Gastos Fixos',
        ),
        Visibility(
          visible: controller.fixedGeneralExpenses.length == 0,
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.defaultPadding
            ),
            child: Text(
              'Não há gastos fixos gerais para selecinar.',
              style: TextStyle(
                color: themeColors.textSecondary
              ),
            ),
          ),
        ),
        ...List.generate(controller.fixedGeneralExpenses.length, (i) {
          SpentStore item = controller.fixedGeneralExpenses[i];
          
          return FixedExpenseItem(
            spent: item,
            change: () {
              item.setSelected(!item.selected);
            },
          );
        })
      ],
    );
  }
}

class FixedExpenseItem extends StatelessWidget {
  
  final SpentStore spent;
  final void Function() change;
  final bool notEnable;

  const FixedExpenseItem({
    Key key,
    @required this.spent,
    this.change,
    this.notEnable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.defaultPadding,
        right: SizeConfig.defaultPadding,
        top: SizeConfig.defaultPadding
      ),
      child: Observer(
        builder: (_){
          return Container(
            width: double.infinity,
            height: 56,
            decoration: BoxDecoration(
              color: getBackgroundColor(spent.selected, notEnable),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.16),
                ),
              ],
            ),
            child: FlatButton(
              onPressed: change,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    spent.title,
                    style: TextStyle(
                      fontSize: 15,
                      color: getTextColor(spent.selected, notEnable)
                    )
                  ),
                  Text(
                    'R\$ ${spent.value}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: getTextColor(spent.selected, notEnable),
                    )
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }

  Color getBackgroundColor(bool selected, bool notEnable){
    if (notEnable) {
      return themeColors.tertiary;
    }

    if (selected && !notEnable) {
      return themeColors.moneyColor.withOpacity(0.4);
    }

    return Colors.transparent;
  }

  Color getTextColor(bool selected, bool notEnable){
    if (notEnable) {
      return themeColors.textPrimary;
    }

    if (selected && !notEnable) {
      return themeColors.textPrimary;
    }

    return themeColors.textSecondary;
  }
}