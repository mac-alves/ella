import 'package:carousel_slider/carousel_controller.dart';
import 'package:ella/app/modules/money/interfaces/local_storage.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/models/expense_store.dart';
import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:ella/app/shared/utils/item_select.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final ILocalStorage _storage = Modular.get();
  
  final CarouselController carouselController = CarouselController();

  final MoneyController money;

  @observable
  ObservableList<EstimateStore> estimates = <EstimateStore>[].asObservable();

  _HomeControllerBase(this.money) {
    _init();
  }

  _init() {
    _setLocalEstimates();
    _setLocalIdsEstimates();
    _setLocalExpenses();
  }

  _setLocalEstimates() async {
    var localEstimates = await _storage.getAllEstimates();

    if (localEstimates == null) {
      money.estimates = <EstimateStore>[
        EstimateStore(
          id: -1,
          month: '',
          startDay: '',
          endDay: '',
          salary: '',
          openingBalance: '',
          finalBalance: '0.00',
          expenses: [
            ExpenseStore(
              type: TypeExpense.FIXED,
              lastValue: 0.00,
              value: 00.00,
              spents: []
            ),
            ExpenseStore(
              type: TypeExpense.EXPECTED,
              lastValue: 00.00,
              value: 00.00,
              spents: []
            ),
            ExpenseStore(
              type: TypeExpense.VARIED,
              lastValue: 00.00,
              value: 00.00,
              spents: []
            ),
          ],
        ),
      ].asObservable();
      setIsNotEstimate(true);
    } else {
      money.estimates = localEstimates.asObservable();
      setIsNotEstimate(false);
    }

    setEstimates(money.estimates);
    int page = (money.estimates.length != 0) ? money.estimates.length - 1 : 0;

    setCurrentEstimate(page);
    setInitialPage(page);
    carouselController.animateToPage(page);
  }

  ///
  /// Preenche os gastos gerais com os dados do banco
  ///
  _setLocalExpenses() async {
    var localFixedExpenses = await _storage.getAllFixedExpenses();
    var localExpectedExpenses = await _storage.getAllExpectedExpenses();

    if (localFixedExpenses == null) {
      money.fixedExpenses = <SpentStore>[].asObservable();
    } else {
      money.fixedExpenses = localFixedExpenses.asObservable();
    }

    if (localExpectedExpenses == null) {
      money.expectedExpenses = <SpentStore>[].asObservable();
    } else {
      money.expectedExpenses = localExpectedExpenses.asObservable();
    }
  }

  ///
  /// Preenche os ids dos orçamentos com os dados do banco
  ///
  _setLocalIdsEstimates() async {
    var localIdsEstimates = await _storage.getAllIdsEstimates();

    if (localIdsEstimates == null) {
      money.idsEstimates = <ItemSelect>[].asObservable();
    } else {
      money.idsEstimates = localIdsEstimates.asObservable();
    }
  }

  @observable
  EstimateStore currentEstimate;

  @observable
  int index;

  @observable
  int initialPage = 0;

  @observable
  String selectedMothFilter;

  @observable
  bool isFilter = false;

  @observable
  bool isNotEstimate = true;

  @action
  void setEstimates(ObservableList value) => estimates = value;

  @action
  void setCurrentEstimate(int index) {
    currentEstimate = estimates.elementAt(index);
    setIndex(index);
  }

  @action
  void setInitialPage(int value) => initialPage = value;

  @action
  void setIndex(int value) => index = value;

  @action
  void setSelectedMothFilter(String value) => selectedMothFilter = value;

  @action
  void setIsFilter(bool value) => isFilter = value;

  @action
  void setIsNotEstimate(bool value) => isNotEstimate = value;

  void goScreen(BuildContext context, String route) async {
    var result = await Navigator.of(context).pushNamed(route);

    await updateCurrentEstimate();
    
    if (result != null) {

      if (result == true) {
        carouselController.animateToPage(estimates.length - 1);
        setIsNotEstimate(false);
      }
    }
  }

  @action
  void setFilter(){
    setEstimates(
      money.estimates
      .where((item) => item.id == int.parse(selectedMothFilter))
      .toList()
      .asObservable()
    );

    currentEstimate = estimates[0]; 
    setIndex(0);
    setInitialPage(0);
    carouselController.jumpToPage(0);
    setIsFilter(true);
  }

  @action
  void clearFilter(){
    setEstimates(money.estimates);
    setCurrentEstimate(money.estimates.length - 1);
    setInitialPage(money.estimates.length - 1);
    carouselController.animateToPage(money.estimates.length - 1);
    setIsFilter(false);
  }

  @action
  Future deleteCurrentEstimate() async {
    await _storage.deleteEstimate(currentEstimate.id);
    await updateCurrentEstimate();
  }

  @action
  Future updateCurrentEstimate() async {    
    if ((money.estimates.length - 1) == 0){
      setIsNotEstimate(true);
    }

    await _setLocalEstimates();
    await _setLocalIdsEstimates();
  }
}
