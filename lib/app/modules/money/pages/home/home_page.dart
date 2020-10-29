import 'package:ella/app/modules/money/money_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
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
              Navigator.of(context).pushNamed('$MONEY_READ/${0}');
            },
            child: Text('read'),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.of(context).pushNamed('$MONEY_CREATE');
            },
            child: Text('create'),
          ),
        ],
      ),
    );
  }
}
