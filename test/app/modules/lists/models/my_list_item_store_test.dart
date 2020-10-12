import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ella/app/modules/lists/models/my_list_item_store.dart';
import 'package:ella/app/modules/lists/lists_module.dart';

void main() {
  initModule(ListsModule());
  // MyListItemStore mylistitem;
  //
  setUp(() {
    //     mylistitem = ListsModule.to.get<MyListItemStore>();
  });

  group('MyListItemStore Test', () {
    //   test("First Test", () {
    //     expect(mylistitem, isInstanceOf<MyListItemStore>());
    //   });

    //   test("Set Value", () {
    //     expect(mylistitem.value, equals(0));
    //     mylistitem.increment();
    //     expect(mylistitem.value, equals(1));
    //   });
  });
}
