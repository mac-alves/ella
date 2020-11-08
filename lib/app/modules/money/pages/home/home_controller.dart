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

  _HomeControllerBase(this.money){
    setCurrentEstimate(money.estimates.length - 1);
    setInitialPage();
  }

  @observable
  EstimateStore currentEstimate;

  @observable
  int index;

  @observable
  int initialPage;

  @action
  void setCurrentEstimate(int index) {
    currentEstimate = money.estimates.elementAt(index);
    setIndex(index);
  }

  @action
  void setInitialPage() {
    initialPage = money.estimates.length - 1;
  }

  @action
  void setIndex(int value) => index = value;

  void goScreen(BuildContext context, String route) async {
    var result = await Navigator.of(context).pushNamed(route);
    if (result != null) {
      setCurrentEstimate(index);

      if (result == true) {
        carouselController.nextPage();
      }
    }
  }
}
