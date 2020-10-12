import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/lists_module.dart';

void main() {
  initModule(ListsModule());
  // MyListStore mylist;
  //
  setUp(() {
    //     mylist = ListsModule.to.get<MyListStore>();
  });

  group('MyListStore Test', () {
    //   test("First Test", () {
    //     expect(mylist, isInstanceOf<MyListStore>());
    //   });

    //   test("Set Value", () {
    //     expect(mylist.value, equals(0));
    //     mylist.increment();
    //     expect(mylist.value, equals(1));
    //   });
  });
}
