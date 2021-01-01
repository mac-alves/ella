import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:ella/app/shared/widgets/secure_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  final String title;
  const CreatePage({Key key, this.title = "Create"}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
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
                  color: themeColors.passwordColor,
                ), 
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: themeColors.passwordColor,
                  ), 
                  onPressed: () {
                  },
                )
              ],
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Observer(
                    builder: (_){
                      return Column(
                        children: [
                          SectionTitle(
                            title: 'Nova Senha',
                          ),
                          InputText(
                            label: 'Nome',
                            placeholder: 'Nome do gasto',
                            change: (value){
                              // controller.newSpent.setTitle(value);
                            },
                            msgError: 'controller.msgErroName',
                            value: '',
                            error: false,
                          ),
                          SecureInput(
                            placeholder: 'Digite a senha',
                            label: 'Senha',
                            change: (value){},
                            msgError: 'controller.msgErroPassword',
                            value: '',
                            error: false,
                          ),
                        ],
                      );
                    }
                  );
                },
                childCount: 1,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 15.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
