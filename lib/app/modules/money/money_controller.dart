import 'package:ella/app/shared/utils/item_select.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/estimate_store.dart';
import 'models/spent_store.dart';

part 'money_controller.g.dart';

@Injectable()
class MoneyController = _MoneyControllerBase with _$MoneyController;

abstract class _MoneyControllerBase with Store {
  
  @observable
  ObservableList<ItemSelect> idsEstimates = <ItemSelect>[].asObservable();

  @observable
  ObservableList<EstimateStore> estimates = <EstimateStore>[].asObservable();

  @observable
  ObservableList<SpentStore> fixedExpenses = <SpentStore>[].asObservable();

  @observable
  ObservableList<SpentStore> expectedExpenses = <SpentStore>[].asObservable();

  _MoneyControllerBase();

  @action
  EstimateStore getEstimate(int id){
    return estimates.firstWhere((element) => element.id == id, orElse: () => null);
  }
}
