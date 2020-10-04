import 'package:flutter/material.dart';

import 'package:ella/screens/lists/home/lists_home_screen.dart';
import 'package:ella/screens/lists/create/lists_create_screen.dart';
import 'package:ella/screens/lists/read/lists_read_screen.dart';

/* routes sub app lists */
const String LISTS_HOME = '/lists';
const String LISTS_CREATE = '/lists/create';
const String LISTS_READ = '/lists/read';


var routes = <String, WidgetBuilder>{
  LISTS_HOME: (context) => ListsHomeScreen(),
  LISTS_CREATE: (context) => ListsCreateScreen(),
  LISTS_READ: (context) => ListsReadScreen(),
};