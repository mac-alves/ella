import 'package:flutter/material.dart';

class Default {
  final primaryColor = Color(0xFF4869E0);
  final getShadow = BoxShadow(
    offset: Offset(5, 5),
    blurRadius: 10,
    color: Color(0xFFE9E9E9).withOpacity(0.56),
  );
}

Default def = new Default();

// App lists
class ConstantsListsApp {
  final primaryColor = Color(0xFFFF9B42);
  final textColor = Color(0xFFFF9642);
  final iconColor = Color(0xFFFF9B42);
  final defaultPadding = 20.0;
  final BoxShadow shadow = def.getShadow;
}

ConstantsListsApp listsApp = new ConstantsListsApp();

// app money
class ContantsMoneyApp {
  final primaryColor = Color(0xFF07889B);
  final textColor = Color(0xFF07889B);
  final iconColor = Color(0xFF07889B);
  final defaultPadding = 20.0;
  final BoxShadow shadow = def.getShadow;
}

ContantsMoneyApp moneyApp = new ContantsMoneyApp();

// password app
class ConstantsPasswordApp{
  final primaryColor = Color(0xFF3BB44B);
  final textColor = Color(0xFF3BB44B);
  final iconColor = Color(0xFF3BB44B);
  final defaultPadding = 20.0;
  final BoxShadow shadow = def.getShadow;
}

ConstantsPasswordApp passwordApp = new ConstantsPasswordApp();