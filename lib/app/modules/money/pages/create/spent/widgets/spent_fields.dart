import 'package:ella/app/shared/widgets/date_picker.dart';
import 'package:ella/app/shared/widgets/drop_down_select.dart';
import 'package:ella/app/shared/widgets/input_switch.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:ella/app/shared/widgets/money_input.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../spent_controller.dart';

class SpentFields extends StatefulWidget {
  
  @override
  _SpentFieldsState createState() => _SpentFieldsState();
}

class _SpentFieldsState extends State<SpentFields> {
  
  SpentController controller = Modular.get<SpentController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Observer(
        builder: (_){
          return Column(
            children: [
              SectionTitle(
                title: 'Novo Gasto',
              ),
              DropDownSelect(
                label: 'Tipo',
                placeholder: 'Selecione o tipo do gasto',
                msgError: 'Tipo não selecionado',
                error: controller.errorType,
                change: (value) => controller.setType(value),
                value: controller.type,
                itens: controller.types,
                disable: controller.isEdit,
              ),
              Visibility(
                visible: controller.enableIdEstimate,
                child: DropDownSelect(
                  label: 'Orçamento referente',
                  placeholder: 'Selecione o orçamento',
                  msgError: 'Orçamento não selecionado',
                  error: controller.errorEstimate,
                  change: (value) => controller.setIdEstimate(value),
                  value: controller.idEstimate,
                  itens: controller.money.idsEstimates,
                  disable: controller.isEdit,
                ),
              ),
              InputText(
                label: 'Nome',
                placeholder: 'Nome do gasto',
                change: (value){
                  controller.newSpent.setTitle(value);
                },
                msgError: controller.msgErroName,
                value: controller.newSpent.title,
                error: controller.erroName,
              ),
              Visibility(
                visible: controller.isSpentExpected,
                child: InputSwitch(
                  title: "Gasto Previsto Geral",
                  selected: controller.enableExpectedGeneral,
                  change: (value) => 
                    controller.setEnableExpectedGeneral(value),
                  disable: controller.isEdit,
                ),
              ),
              Visibility(
                visible: controller.enableValue,
                child: MoneyInput(
                  label: 'Valor',
                  placeholder: 'Valor do gasto',
                  change: (value){
                    controller.newSpent.setValue(value);
                  },
                  msgError: 'Digite um valor valido',
                  value: controller.newSpent.value,
                  error: controller.erroValue,
                ),
              ),
              Visibility(
                visible: controller.enableDate,
                child: DatePicker(
                  label: 'Data',
                  placeholder: 'Data do gasto',
                  value: controller.newSpent.date,
                  change: (value) => controller.newSpent.setDate(value),
                  msgError: 'Data não selecionada',
                  error: controller.errorDate,
                )
              ),
            ],
          );
        }
      ),
    );
  }
}