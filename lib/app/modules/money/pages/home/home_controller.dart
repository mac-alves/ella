import 'package:carousel_slider/carousel_controller.dart';
import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/modules/money/money_controller.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final CarouselController carouselController = CarouselController();

  final MoneyController money;

  @observable
  ObservableList<EstimateStore> estimates = <EstimateStore>[].asObservable();

  _HomeControllerBase(this.money) {
    setEstimates(money.estimates);
    setCurrentEstimate(money.estimates.length - 1);
    setInitialPage(money.estimates.length - 1);
  }

  @observable
  EstimateStore currentEstimate;

  @observable
  int index;

  @observable
  int initialPage;

  @observable
  String selectedMothFilter;

  @observable
  bool isFilter = false;

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

  void goScreen(BuildContext context, String route) async {
    var result = await Navigator.of(context).pushNamed(route);
    if (result != null) {
      setEstimates(money.estimates);
      setCurrentEstimate(index);

      if (result == true) {
        carouselController.animateToPage(estimates.length - 1);
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
}
