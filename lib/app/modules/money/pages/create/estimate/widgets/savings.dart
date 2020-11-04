import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/money_input.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../estimate_controller.dart';

class Savings extends StatefulWidget {

  final bool enableSaving;
  final void Function(bool) changeEnableSaving;

  const Savings({
    Key key, 
    @required this.enableSaving,
    @required this.changeEnableSaving
  }) : super(key: key);

  @override
  _SavingsState createState() => _SavingsState();
}

class _SavingsState extends State<Savings> {
  
  EstimateController controller = Modular.get<EstimateController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            VerticalSpacing(of:10),
            SectionTitle(
              title: 'Poupança',
              hasAction: true,
              action: Switch(
                value: controller.enableSaving,
                onChanged: controller.setEnableSaving,
                activeColor: themeColors.moneyColor,
                inactiveTrackColor: themeColors.tertiary,
              ),
            ),
            MoneyInput(
              label: 'Valor a depositar na poupança',
              placeholder: 'Saldo Existente',
              change: (value){},
              msgError: 'Digite um valor valido',
              error: false,
              enable: controller.enableSaving,
            ),
          ],
        );
      }
    );
  }
}