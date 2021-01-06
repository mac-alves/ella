import 'package:ella/app/modules/shopping/models/shopping_item_store.dart';
import 'package:ella/app/modules/shopping/models/shopping_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
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

  ReactionDisposer whenDispose;

  @override
  void initState() {
    super.initState();
    controller.setNewShopping(
      new ShoppingStore(
        id: 20, 
        title: null,
        amount: 0.0,
        qtItems: 0,
        selected: false
      )
    );

    if (widget.id != null) {
      controller.prepareShoppingToEdit(controller.shopping.getShopping(widget.id));
    } else {
      whenDispose = when(
        (r) => controller.idNewShopping != null, 
        () => controller.newShopping.setId(controller.idNewShopping)
      );
    }
  }
  
  @override
  void dispose() {
    super.dispose();
    if (whenDispose != null) {
      whenDispose();
    }
  }

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
                    if (controller.shoppingIsValid()) {
                      String message = 'Compra criada com sucesso.';

                      if (widget.id == null) {
                        controller.createShopping(controller.newShopping);
                      } else {
                        controller.updateShopping(controller.newShopping);
                        message = 'Compra atualizada com sucesso.';
                      }

                      SnackMesage(context).show('$message');
                      Navigator.of(context).pop();
                    }
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
                      ShoppingItemStore item = controller.newShopping.items[index];

                      return Dismissible(
                        key: Key(item.id.toString()),
                        onDismissed: (direction) {
                          controller.newShopping.items.remove(item);
                          controller.setAmount();
                        },
                        child: ShoppingItem(
                          item: item,
                        ),
                      );
                    },
                    childCount: controller.newShopping.items.length,
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

