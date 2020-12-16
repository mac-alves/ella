import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/modules/money/models/type_expense.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'expense_store.g.dart';

@Injectable()
class ExpenseStore extends _ExpenseStoreBase with _$ExpenseStore {
  ExpenseStore({
    TypeExpense type,
    double value,
    double lastValue,
    List<SpentStore> spents: const []
  }) : super(type: type, value: value, lastValue: lastValue, spents: spents);

  ExpenseStore fromJson(Map<String, dynamic> json) {
    ObservableList<SpentStore> spents = <SpentStore>[].asObservable();
    
    if (json['spents'] != null) {
      json['spents'].forEach((v) {
        spents.add(new SpentStore().fromJson(v));
      });
    }

    return ExpenseStore(
      type: getTypeFromString(json['type']),
      value: json['value'],
      lastValue: json['lastValue'],
      spents: spents
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['type'] = this.type.toString();
    data['value'] = this.value;
    data['lastValue'] = this.lastValue;
    if (this.spents != null) {
      data['spents'] = this.spents.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

abstract class _ExpenseStoreBase with Store {
  @observable
  TypeExpense type;

  @observable
  double value;

  @observable
  double lastValue;

  @observable
  ObservableList<SpentStore> spents = <SpentStore>[].asObservable();

  _ExpenseStoreBase({
    this.type,
    this.value,
    this.lastValue,
    List<SpentStore> spents
  }) {
    this.spents = spents.asObservable() ?? <SpentStore>[].asObservable();
  }

  @action
  setType(TypeExpense value) => type = value;

  @action
  setValue(double newValue) => value = newValue;

  @action
  setLastValue(double value) => lastValue = value;
}
