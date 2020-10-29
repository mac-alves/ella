import 'package:ella/app/modules/money/pages/create/create_page.dart';
import 'package:ella/app/modules/money/pages/home/home_page.dart';
import 'package:ella/app/modules/money/pages/read/read_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

const String HOME = '/';
const String CREATE = '/create';
const String READ = '/read';

const String MONEY = '/money';
const String MONEY_HOME = MONEY;
const String MONEY_CREATE = MONEY + CREATE;
const String MONEY_READ = MONEY + READ;

var routes = [
  ModularRouter(HOME, child: (_, args) => HomePage()),
  ModularRouter(MONEY_CREATE, child: (_, args) => CreatePage()),
  ModularRouter(
    MONEY_CREATE + "/:id",
    child: (_, args) => CreatePage(id: int.parse(args.params['id']))),
  ModularRouter(
    MONEY_READ + "/:id",
    child: (_, args) => ReadPage(id: int.parse(args.params['id']))
  ),
];