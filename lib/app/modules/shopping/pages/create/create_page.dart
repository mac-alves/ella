import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'create_controller.dart';
import 'widget/amount.dart';
import 'widget/shopping_item.dart';

class CreatePage extends StatefulWidget {
  final int id;
  const CreatePage({Key key, this.id }) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: themeColors.primary,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              snap: false,
              backgroundColor:  themeColors.secondary,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: themeColors.shoppingColor,
                ), 
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: themeColors.shoppingColor,
                  ), 
                  onPressed: () {
                    // if (controller.validateNewPassword()) {
                    //   String message = 'Senha criada com sucesso.';

                    //   if (widget.id == null) {
                    //     controller.createPassword(controller.newPassword);
                    //   } else {
                    //     controller.updatePassword(controller.newPassword);
                    //     message = 'Senha atualizada com sucesso.';
                    //   }

                    //   SnackMesage(context).show('$message');
                    //   Navigator.of(context).pop();
                    // }
                  },
                )
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Amount();
                },
                childCount: 1,
              ),
            ),
            Observer(
              builder: (_){

                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = controller.shoppingItems[index];

                      return Dismissible(
                        key: Key(item),
                        onDismissed: (direction) {
                          controller.shoppingItems.remove(item);
                        },
                        child: ShoppingItem(),
                      );
                    },
                    childCount: controller.shoppingItems.length,
                  ),
                );
              }
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 40.0
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.addItem();
          },
          child: Icon(
            Icons.add,
            size: 28,
            color: themeColors.primary,
          ),
          backgroundColor: themeColors.shoppingColor,
        ),
      ),
    );
  }
}

