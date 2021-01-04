import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Amount extends StatelessWidget {
  const Amount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_){
        return Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 30
                  ),
                  child: Column(
                    children: [
                      Text(
                        'R\$ 1085,66',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: getPropScreenWidth(50),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: getPropScreenWidth(275),
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(400, 20)
                          ),
                          color: themeColors.shoppingColor.withOpacity(0.2)
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8
                        ),
                        child: Text(
                          "Quantidade de itens: 20",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: themeColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            InputText(
              placeholder: 'Titulo da compra',
              change: (value){},
              msgError: 'controller.msgErroTitle',
              value: '',
              error: false,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultPadding,
                vertical: SizeConfig.defaultPadding,
              ),
              child: Row(
                children: [
                  Container(
                    width: getPropScreenWidth(70),
                    child: Text(
                      "Quant.",
                      style: TextStyle(
                        fontSize: 14,
                        color: themeColors.textSecondary,
                      )
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Nome",
                      style: TextStyle(
                        fontSize: 14,
                        color: themeColors.textSecondary,
                      )
                    ),
                  ),
                  Container(
                    width: getPropScreenWidth(95),
                    child: Text(
                      "Valor",
                      style: TextStyle(
                        fontSize: 14,
                        color: themeColors.textSecondary,
                      )
                    ),
                  ),
                  // Spacer(),
                  // Observer(
                  //   builder: (_){
                  //     return Container(
                  //       child: !controller.erroItems ? null : Text(
                  //         controller.msgErroItems,
                  //         style: TextStyle(
                  //           fontSize: 12,
                  //           color: Colors.red[600]
                  //         ),
                  //       ),
                  //     );
                  //   }
                  // ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
