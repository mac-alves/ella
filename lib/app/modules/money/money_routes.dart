import 'package:ella/app/modules/money/pages/home/home_page.dart';
import 'package:ella/app/modules/money/pages/read/read_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/create/estimate/estimate_page.dart';
import 'pages/create/spent/spent_page.dart';

const String HOME = '/';
const String CREATE = '/create';
const String READ = '/read';

const String MONEY = '/money';
const String MONEY_HOME = MONEY;
const String MONEY_CREATE_ESTIMATE = MONEY + CREATE + '/estimate';
const String MONEY_CREATE_SPENT = MONEY + CREATE + '/spent';
const String MONEY_READ = MONEY + READ;

var routes = [
  ModularRouter(HOME, child: (_, args) => HomePage()),
  
  ModularRouter(MONEY_CREATE_ESTIMATE, child: (_, args) => EstimatePage()),
  ModularRouter(
    MONEY_CREATE_ESTIMATE + "/:id",
    child: (_, args) => EstimatePage(id: int.parse(args.params['id']))),
  
  ModularRouter(MONEY_CREATE_SPENT, child: (_, args) => SpentPage()),
  ModularRouter(
    MONEY_CREATE_SPENT + "/:id",
    child: (_, args) => SpentPage(id: int.parse(args.params['id']))),
  
  ModularRouter(
    MONEY_READ + "/:id",
    child: (_, args) => ReadPage(id: int.parse(args.params['id']))
  ),
];