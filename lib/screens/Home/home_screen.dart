import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina de testes"),
      ),
      body: Column(
        children: [
          Text("Tetse")
        ],
      ),
    );
  }
}