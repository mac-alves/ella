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
        VerticalSpacing(of:10),
        SectionTitle(
          title: 'Gastos Fixos',
        ),
        ...List.generate(controller.fixedExpenses.length, (i) {
          SpentStore item = controller.fixedExpenses[i];
          
          return FixedExpenseItem(
            spent: item,
            change: (){
              item.setSelected();
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

  const FixedExpenseItem({
    Key key,
    @required this.spent,
    @required this.change,
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
              color: spent.selected 
                ? themeColors.moneyColor.withOpacity(0.4) 
                : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
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
                      color: spent.selected 
                        ? themeColors.textPrimary
                        : themeColors.textSecondary
                    )
                  ),
                  Text(
                    'R\$ ${spent.value}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: spent.selected 
                        ? themeColors.textPrimary
                        : themeColors.textSecondary,
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
}