import 'package:ella/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class AlertDialogConfirm {
  
  BuildContext context;
  List<Widget> content;
  Function onPressCancel;
  Function onPressFilter;

  AlertDialogConfirm({
    @required this.context,
    @required this.onPressCancel,
    @required this.onPressFilter,
    @required this.content,
  });

  show() {
    Widget notButton = RaisedButton(
      color: themeColors.secondary,
      child: Text("Cancelar"),
      onPressed: onPressCancel,
    );

    Widget yesButton = RaisedButton(
      child: Text("Filtrar"),
      color: themeColors.secondary,
      onPressed: onPressFilter,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Filtrar orçamentos"),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      content: Container(
        height: 90,
        child: Stack(
          children: content,
        ),
      ),
      backgroundColor: themeColors.tertiary,
      titleTextStyle: TextStyle(
        color: themeColors.textPrimary,
        fontSize: 20,
      ),
      contentTextStyle: TextStyle(
        color: themeColors.textSecondary,
        fontSize: 18,
      ),
      actions: [
        notButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}