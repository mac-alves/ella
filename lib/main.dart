import 'package:ella/screens/Home/home_screen.dart';
import 'package:ella/screens/lists/home/lists_home_screen.dart';
import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EllA App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.poppinsTextTheme().apply(displayColor: listsApp.textColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ListsHomeScreen(),
    );
  }
}