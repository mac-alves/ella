import 'package:ella/app/modules/money/money_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  final String title;
  final int id;
  const CreatePage({Key key, this.title = "Create", this.id}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('/');
            },
            child: Text('home'),
          ),
        ],
      ),
    );
  }
}
