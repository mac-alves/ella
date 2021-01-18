import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class PopUpDialog {
  
  BuildContext context;
  List<Widget> content;
  Function onPressCancel;
  Function onPressConfirm;
  String textConfirm;
  String titleDialog;
  double height;

  PopUpDialog({
    @required this.context,
    @required this.onPressCancel,
    @required this.onPressConfirm,
    @required this.content,
    @required this.textConfirm,
    @required this.titleDialog,
    @required this.height,
  });

  show() {
    Widget notButton = RaisedButton(
      color: themeColors.secondary,
      child: Text("Cancelar"),
      onPressed: onPressCancel,
    );

    Widget yesButton = RaisedButton(
      child: Text("$textConfirm"),
      color: themeColors.secondary,
      onPressed: onPressConfirm,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("$titleDialog"),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 0
      ),
      titlePadding: EdgeInsets.all(12),
      actionsPadding: EdgeInsets.symmetric(
        horizontal: 9
      ),
      content: Container(
        height: height,
        width: getPropScreenWidth(350),
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