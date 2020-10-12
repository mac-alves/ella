/* routes sub app lists */
import 'package:ella/app/modules/lists/pages/create/create_page.dart';
import 'package:ella/app/modules/lists/pages/home/home_page.dart';
import 'package:ella/app/modules/lists/pages/read/read_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

const String HOME = '/';
const String CREATE = '/create';
const String READ = '/read';

const String LISTS = '/lists';
const String LISTS_HOME = LISTS;
const String LISTS_CREATE = LISTS + CREATE;
const String LISTS_READ = LISTS + READ;

var routes = [
  ModularRouter(HOME, child: (_, args) => HomePage()),
  ModularRouter(LISTS_CREATE, child: (_, args) => CreatePage()),
  ModularRouter(
    LISTS_CREATE + "/:id",
    child: (_, args) => CreatePage(id: int.parse(args.params['id']))),
  ModularRouter(
    LISTS_READ + "/:id",
    child: (_, args) => ReadPage(id: int.parse(args.params['id']))
  ),
];