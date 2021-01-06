import 'package:ella/app/modules/lists/pages/create/create_controller.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Header extends StatefulWidget {

  const Header({ Key key }) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends ModularState<Header, CreateController> {

  CreateController controller = Modular.get<CreateController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacing(of: SizeConfig.defaultPadding),
        Observer(
          builder: (_){
            return InputText(
              label: 'Titulo',
              placeholder: 'Titulo da lista',
              change: controller.newMyList.setName,
              msgError: 'Campo obrigátorio',
              value: controller.newMyList.name,
              error: controller.erroName,
            );
          }
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.defaultPadding,
            vertical: SizeConfig.defaultPadding / 2,
          ),
          child: Row(
            children: [
              Text(
                "Itens",
                style: TextStyle(
                  fontSize: 14,
                  color: themeColors.textSecondary,
                )
              ),
              Spacer(),
              Observer(
                builder: (_){
                  return Container(
                    child: !controller.erroItems ? null : Text(
                      controller.msgErroItems,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red[600]
                      ),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}