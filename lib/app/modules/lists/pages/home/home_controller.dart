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

  @observable
  ObservableList<int> listListsToDelete = <int>[].asObservable();

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

  @observable
  bool isDelete = false;

  @action
  void setIsDelete(bool value) => isDelete = value;

  @action
  void selectToDelete(int idPass) {
    if (!listListsToDelete.contains(idPass)) {
      listListsToDelete.add(idPass);
      setIsDelete(true);
    }
  }

  @action
  void removeToDelete(int idPass) {
    listListsToDelete.remove(idPass);

    if (listListsToDelete.length == 0) {
      setIsDelete(false);
    }
  }

  /// 
  /// Deleta os gastos
  /// 
  @action
  Future deleteListsSelecteds() async {    
    lists.myLists = lists.myLists.where((pass) {
      return !listListsToDelete.contains(pass.id);
    }).toList().asObservable();

    await _storage.delete(listListsToDelete.join(','));

    listListsToDelete = <int>[].asObservable();
    setIsDelete(false);
  }
}
