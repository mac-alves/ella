import 'package:flutter/material.dart';

class SnackMesage {
  BuildContext context;

  SnackMesage(this.context);

  show(String message){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message)
      )
    );
  }
}