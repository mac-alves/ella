import 'package:ella/app/modules/lists/interfaces/local_storage.dart';
import 'package:ella/app/modules/lists/lists_controller.dart';
import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final ILocalStorage _storage = Modular.get();
  final ListsController lists;

  _HomeControllerBase(this.lists) {
    _init();
  }

  _init() async {
    var localLists = await _storage.getAll();

    if (localLists == null) {
      lists.myLists = <MyListStore>[].asObservable();
    } else {
      lists.myLists = localLists.asObservable();
    }
  }

  Future deleteAllLists() async {
    lists.myLists.clear();
    await _storage.deleteAll(); 
  }
}
