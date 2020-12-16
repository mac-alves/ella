import 'package:ella/app/modules/money/pages/home/home_page.dart';
import 'package:ella/app/modules/money/pages/read/read_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pages/create/estimate/estimate_page.dart';
import 'pages/create/spent/spent_page.dart';

const String HOME = "/";
const String CREATE = "/create";
const String READ = "/read";

const String MONEY                 = "/money";
const String MONEY_HOME            = "$MONEY";
const String MONEY_CREATE_ESTIMATE = "$MONEY$CREATE/estimate";
const String MONEY_CREATE_SPENT    = "$MONEY$CREATE/spent";
const String MONEY_READ            = "$MONEY$READ";

var routes = [
  ModularRouter(HOME, child: (_, args) => HomePage()),
  
  /// 
  /// Criação de orçamentos
  /// 
  ModularRouter(
    MONEY_CREATE_ESTIMATE, 
    child: (_, args) => EstimatePage()
  ),
  
  /// 
  /// Alteração de orçamento
  /// 
  /// :id -> id do orçamento
  /// 
  ModularRouter(
    "$MONEY_CREATE_ESTIMATE/:id",
    child: (_, args) => EstimatePage(
      id: int.parse(args.params['id'])
    )
  ),
  
  /// 
  /// Criação de gastos
  /// 
  /// :id -> id do orçamento
  /// 
  ModularRouter(
    "$MONEY_CREATE_SPENT/:id",
    child: (_, args) => SpentPage(
      idEstimate: int.parse(args.params['id'])
    )
  ),

  /// 
  /// Criação de gastos sem orçamento
  /// 
  /// :id -> id do orçamento
  /// 
  ModularRouter(
    "$MONEY_CREATE_SPENT/:id/notEstimate",
    child: (_, args) => SpentPage(
      idEstimate: int.parse(args.params['id']),
      notEstimate: true,
    )
  ),

  /// 
  /// Alteração de gastos fixos gerais
  /// 
  /// :idSpent -> id do gasto
  /// 
  ModularRouter(
    "$MONEY_CREATE_SPENT/fixed/:idSpent",
    child: (_, args) => SpentPage(
      isFixedGeneral: 'true',
      idSpent: args.params['idSpent'],
    )
  ),

  /// 
  /// Alteração de gastos previstos gerais
  /// 
  /// :idSpent -> id do gasto
  /// 
  ModularRouter(
    "$MONEY_CREATE_SPENT/expected/:idSpent",
    child: (_, args) => SpentPage(
      isExpectedGeneral: 'true',
      idSpent: args.params['idSpent'],
    )
  ),

  /// 
  /// Alteração de gastos do orçamento
  /// 
  /// :id -> id do orçamento
  /// :type -> tipo do gasto
  /// :idSpent -> id do gasto
  /// 
  ModularRouter(
    "$MONEY_CREATE_SPENT/estimate/:id/:type/:idSpent",
    child: (_, args) => SpentPage(
      idEstimate: int.parse(args.params['id']),
      typeExpense: args.params['type'],
      idSpent: args.params['idSpent'],
    )
  ),
  
  /// 
  /// Visualização dos gastos do orçamento
  /// 
  /// :id -> id do orçamento
  /// :type -> tipo do gasto
  /// 
  ModularRouter(
    "$MONEY_READ/:id/:type",
    child: (_, args) => ReadPage(
      idEstimate: int.parse(args.params['id']),
      typeExpensse: args.params['type'],
    )
  ),

  /// 
  /// Visualização dos gastos fixos gerais
  /// 
  ModularRouter(
    "$MONEY_READ/fixed",
    child: (_, args) => ReadPage(
      isFixedGeneral: 'true',
    )
  ),

  /// 
  /// Visualização dos gastos previstos gerais
  /// 
  ModularRouter(
    "$MONEY_READ/expected",
    child: (_, args) => ReadPage(
      isExpectedGeneral: 'true',
    )
  ),
];