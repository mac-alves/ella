import 'package:ella/app/shared/widgets/drop_down_select.dart';
import 'package:ella/app/shared/widgets/form_fields/money_input.dart';
import 'package:ella/app/shared/widgets/interval_date_picker.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../estimate_controller.dart';

class EstimateFields extends StatefulWidget {
    
  const EstimateFields({
    Key key,
  }) : super(key: key);

  @override
  _EstimateFieldsState createState() => _EstimateFieldsState();
}

class _EstimateFieldsState extends State<EstimateFields> {

  EstimateController controller = Modular.get<EstimateController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Form(
        key: controller.formKey,
        child: Observer(
          builder: (_){
            return Column(
              children: [
                SectionTitle(
                  title: 'Novo Orçamento',
                ),
                DropDownSelect(
                  label: 'Mês referente',
                  placeholder: 'Selecione um mês',
                  msgError: 'Mês não selecionado',
                  error: controller.errorMonth,
                  change: (value){
                    controller.newEstimate.setMonth(value);
                  },
                  value: controller.newEstimate.month,
                  itens: [
                    new ItemSelect(id: '1', name: 'Fixo'),
                    new ItemSelect(id: '2', name: 'Previsto'),
                    new ItemSelect(id: '3', name: 'Variado'),
                  ],
                ),
                IntervalDatePicker(
                  label: 'Intervalo de dias',
                  valueInitial: controller.newEstimate.startDay,
                  valueFinal: controller.newEstimate.endDay,
                  changeInitial: (value){
                    controller.newEstimate.setStartDay(value);
                  },
                  changeFinal: (value){
                    controller.newEstimate.setEndDay(value);
                  },
                  errorInitial: controller.errorStartDay,
                  errorFinal: controller.errorEndDay
                ),
                MoneyInput(
                  label: 'Salário',
                  placeholder: 'Saldo recebido',
                  change: (value){
                    controller.newEstimate.setSalary(value);
                  },
                  msgError: 'Digite um valor valido',
                ),
                MoneyInput(
                  label: 'Saldo na conta',
                  placeholder: 'Saldo Existente',
                  change: (value){
                    controller.newEstimate.setOpeningBalance(value);
                  },
                  msgError: 'Digite um valor valido',
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}