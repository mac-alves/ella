import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'password_store.g.dart';

@Injectable()
class PasswordStore extends _PasswordStoreBase with _$PasswordStore{
  
  PasswordStore({
    int id,
    String title,
    String password,
    bool selected,
    bool visible
  }) : super(
    id: id, 
    title: title, 
    password: password, 
    selected: selected, 
    visible: visible
  );

  PasswordStore fromJson(Map<String, dynamic> json) {
    return new PasswordStore(
      id: json['id'],
      title: json['title'],
      password: json['password'],
      selected: json['selected'],
      visible: json['visible']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['password'] = this.password;
    data['selected'] = this.selected;
    data['visible'] = this.visible;
    
    return data;
  }
}

abstract class _PasswordStoreBase with Store {
  
  @observable
  int id;

  @observable
  String title;

  @observable
  String password;

  @observable
  bool selected;

  @observable
  bool visible;

  _PasswordStoreBase({
    this.id,
    this.title,
    this.password,
    this.selected,
    this.visible
  });

  @action
  setId(int value) => id = value;

  @action
  setTitle(String value) => title = value;

  @action
  setPassword(String value) => password = value;

  @action
  setSelected(bool value) => selected = value;

  @action
  setVisible(bool value) => visible = value;
}
