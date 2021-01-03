import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:ella/app/shared/widgets/input_text.dart';
import 'package:ella/app/shared/widgets/section_title.dart';
import 'package:ella/app/shared/widgets/secure_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'create_controller.dart';

class CreatePage extends StatefulWidget {
  
  final int id;

  const CreatePage({Key key, this.id}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends ModularState<CreatePage, CreateController> {
  //use 'controller' variable to access controller

  ReactionDisposer whenDispose;

  @override
  void initState() {
    super.initState();
    controller.setNewPassword(
      new PasswordStore(
        id: null, title: null, password: null, selected: false, visible: false
      )
    );

    if (widget.id != null) {
      controller.setNewPassword(controller.password.getPassword(widget.id));
    } else {
      whenDispose = when(
        (r) => controller.idNewPassword != null, 
        () => controller.newPassword.setId(controller.idNewPassword)
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
                    if (controller.validateNewPassword()) {
                      String message = 'Senha criada com sucesso.';

                      if (widget.id == null) {
                        controller.createPassword(controller.newPassword);
                      } else {
                        controller.updatePassword(controller.newPassword);
                        message = 'Senha atualizada com sucesso.';
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
                            change: controller.newPassword.setTitle,
                            msgError: controller.msgErroTitle,
                            value: controller.newPassword.title,
                            error: controller.erroTitle,
                          ),
                          SecureInput(
                            label: 'Senha',
                            placeholder: 'Digite a senha',
                            change: controller.newPassword.setPassword,
                            msgError: controller.msgErroPassword,
                            value: controller.newPassword.password,
                            error: controller.erroPassword,
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
