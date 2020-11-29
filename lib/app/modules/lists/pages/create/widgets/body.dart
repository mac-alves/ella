import 'package:ella/app/modules/lists/models/my_list_store.dart';
import 'package:ella/app/modules/lists/pages/create/create_controller.dart';
import 'package:ella/app/modules/lists/pages/create/widgets/item_list.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Body extends StatefulWidget {

  const Body({ Key key }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends ModularState<Body, CreateController> {

  CreateController controller = Modular.get<CreateController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        clipBehavior: Clip.none,
        child: Column(
          children: [
            VerticalSpacing(of: SizeConfig.defaultPadding),
            Observer(
              builder: (_){
                return InputText(
                  label: 'Titulo',
                  placeholder: 'Titulo da lista',
                  change: controller.newMyList.setName,
                  msgError: 'Campo obrigátorio',
                  value: controller.newMyList.name,
                  error: controller.erroName,
                );
              }
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.defaultPadding,
                vertical: SizeConfig.defaultPadding / 2,
              ),
              child: Row(
                children: [
                  Text(
                    "Itens",
                    style: TextStyle(
                      fontSize: 14,
                      color: themeColors.textSecondary,
                    )
                  ),
                  Spacer(),
                  Observer(
                    builder: (_){
                      return Container(
                        child: !controller.erroItems ? null : Text(
                          controller.msgErroItems,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.red[600]
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                return MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.newMyList.items != null 
                      ? controller.newMyList.items.length 
                      : 0,
                    itemBuilder: (BuildContext ctxt, int index) {
                      final item = controller.newMyList.items[index];

                      return Dismissible(
                        key: Key(item.id.toString()),
                        onDismissed: (direction) =>
                          controller.removeListItem(controller.newMyList, item),
                        child: ItemList(
                          value: item.name,
                          change: item.setName,
                          press: () => 
                            controller.removeListItem(controller.newMyList, item),
                        ),
                      );
                    }
                  ),
                );
              }
            ),
            VerticalSpacing(of: 100,),
          ],
        ),
      ),
    );
  }
}