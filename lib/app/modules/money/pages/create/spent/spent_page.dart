import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'spent_controller.dart';

class SpentPage extends StatefulWidget {
  final int id;
  const SpentPage({Key key, this.id}) : super(key: key);

  @override
  _SpentPageState createState() => _SpentPageState();
}

class _SpentPageState extends ModularState<SpentPage, SpentController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.id}'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
