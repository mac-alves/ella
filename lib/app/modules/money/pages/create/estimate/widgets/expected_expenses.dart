import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/form_fields/money_input.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../estimate_controller.dart';

class ExpectedExpenses extends StatefulWidget {

  final bool enableSaving;
  final void Function(bool) changeEnableSaving;

  const ExpectedExpenses({
    Key key, 
    @required this.enableSaving,
    @required this.changeEnableSaving
  }) : super(key: key);

  @override
  _ExpectedExpensesState createState() => _ExpectedExpensesState();
}

class _ExpectedExpensesState extends State<ExpectedExpenses> {
  
  EstimateController controller = Modular.get<EstimateController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKeyExpectedFields,
      child: Column(
        children: [
          ...List.generate(controller.expectedExpenses.length, (i) {
            SpentStore item = controller.expectedExpenses[i];
            
            return ExpectedField(
              spent: item,
            );
          })
        ],
      ),
    );
  }
}

class ExpectedField extends StatelessWidget {

  final SpentStore spent;

  const ExpectedField({
    Key key,
    @required this.spent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            VerticalSpacing(of:10),
            SectionTitle(
              title: spent.title,
              hasAction: true,
              action: Switch(
                value: spent.selected,
                onChanged: (bool value) {
                  // controller.setEnableSavings(value)
                  spent.setSelected(value);
                },
                activeColor: themeColors.moneyColor,
                inactiveTrackColor: themeColors.tertiary,
              ),
            ),
            MoneyInput(
              label: 'Valor do gasto esperado',
              placeholder: 'Saldo depositado',
              change: (value) => spent.setValue(value),
              msgError: 'Digite um valor valido',
              value: spent.value,
              enable: spent.selected,
            ),
          ],
        );
      }
    );
  }
}