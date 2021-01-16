import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class LoadingDialog {

  BuildContext context;
  Color color;
  LoadingDialog(this.context);

  show(Color color) {
    Dialog dialog = Dialog(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.defaultPadding),
        height: getPropScreenHeight(150),
        decoration: BoxDecoration(
          color: themeColors.tertiary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor:themeColors.tertiary,
              valueColor: new AlwaysStoppedAnimation<Color>(color),
            ),
            SizedBox(height: SizeConfig.defaultPadding),
            Text(
              'Carregando...',
              style: TextStyle(
                color: themeColors.textPrimary
              )
            )
          ],
        ),
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }
}