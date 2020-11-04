import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_routes.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Spent extends StatelessWidget {

  final ExpenseStore expense;

  const Spent({
    Key key, 
    @required this.expense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(
              top: SizeConfig.defaultPadding,
              left: SizeConfig.defaultPadding,
              right: SizeConfig.defaultPadding,
            ),
            child: Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                color: themeColors.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: themeColors.tertiary
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
                onPressed: () {
                  Navigator.of(context).pushNamed('$MONEY_READ');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Icon(
                      (expense.type == TypeExpense.FIXED) ? 
                        Icons.show_chart : 
                        (expense.type == TypeExpense.EXPECTED) ? 
                          Icons.equalizer : Icons.bar_chart, 
                      // equalizer //bar_chart
                      color: themeColors.moneyColor,
                      size: 33,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (expense.type == TypeExpense.FIXED) ? 
                                'Fixos' : 
                                (expense.type == TypeExpense.EXPECTED) ? 
                                  'Previstos' : 'Variados',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                color: themeColors.textPrimary
                              )
                            ),
                            Text(
                              'Útimo valor: R\$ ${expense.lastValue}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                color: themeColors.textSecondary
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      'R\$ ${expense.value}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        color: themeColors.textPrimary
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}