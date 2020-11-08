import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'spent_store.g.dart';

@Injectable()
class SpentStore extends _SpentStoreBase with _$SpentStore { 
  SpentStore({
    String title,
    String value,
    String date,
    bool selected,
  }) : super(title: title, value: value, date: date, selected: selected);

  SpentStore fromJson(Map<String, dynamic> json) {
    return new SpentStore(
      title: json['title'],
      value: json['value'],
      date: json['date'],
      selected: json['selected']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['value'] = this.value;
    data['date'] = this.date;
    data['selected'] = this.selected;
    return data;
  }
}

abstract class _SpentStoreBase with Store {
  
  @observable
  String title;

  @observable
  String value;

  @observable
  String date;

  @observable
  bool selected = false;

  _SpentStoreBase({
    this.title,
    this.value,
    this.date,
    this.selected,
  });

  @action
  setTitle(String value) => title = value;

  @action
  setValue(String newValue) => value = newValue;

  @action
  setDate(String value) => date = value;

  @action
  setSelected() => selected = !selected;
}
