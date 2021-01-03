import 'package:ella/app/modules/password/models/password_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../password_routes.dart';
import '../home_controller.dart';

class PasswordItem extends StatefulWidget {

  final PasswordStore password;

  const PasswordItem({
    Key key,
    @required this.password,
  }) : super(key: key);

  @override
  _PasswordItemState createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {

  HomeController controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.defaultPadding,
          left: SizeConfig.defaultPadding,
          right: SizeConfig.defaultPadding,
        ),
        child: Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
            color: themeColors.passwordColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 3,
                color: Colors.black.withOpacity(0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: getPropScreenWidth(75),
                height: 76,
                child: Observer(
                  builder: (_){
                    return FlatButton(
                      onPressed: (){
                        widget.password.setVisible(
                          !widget.password.visible
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(
                        widget.password.visible 
                          ? Icons.visibility_off
                          : Icons.visibility,
                        color: Colors.white,
                        size: 33,
                      ),
                    );
                  }
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (_){
                    return Container(
                      decoration: BoxDecoration(
                        color: themeColors.tertiary,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: widget.password.selected 
                            ? themeColors.passwordColor
                            : themeColors.tertiary
                        ),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15
                        ),
                        onPressed: (){
                          controller.removeToDelete(widget.password.id);
                          widget.password.setSelected(false);
                        },
                        onLongPress: (){
                          controller.selectToDelete(widget.password.id);
                          widget.password.setSelected(true);
                        },
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.password.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: themeColors.textPrimary
                                  )
                                ),
                                SizedBox(height: 5,),
                                Observer(
                                  builder: (_){
                                    return Container(
                                      height: 25,
                                      width: double.infinity,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Text(
                                          widget.password.visible 
                                            ? widget.password.password
                                            : '**********',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: themeColors.textSecondary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                ),
                              ],
                            ),
                            Positioned(
                              right: -15,
                              child: PopupMenuButton<String>(
                                captureInheritedThemes: true,
                                color: themeColors.secondary,
                                icon: Icon(
                                  Icons.more_vert,
                                  color: themeColors.passwordColor,
                                ),
                                onSelected: (String item) {
                                  if (item == 'Editar') {
                                    Navigator.of(context).pushNamed(
                                      '$PASSWORD_CREATE/${widget.password.id}'
                                    );
                                  }

                                  if (item == 'Copiar') {
                                    Clipboard.setData(
                                      new ClipboardData(
                                        text: widget.password.password
                                      )
                                    );
                                    
                                    SnackMesage(context).show('Senha copiada.');
                                  }
                                },
                                itemBuilder: (BuildContext context) {
                                  return ['Editar', 'Copiar'].map((String choice){
                                    return PopupMenuItem<String>(
                                      value: choice,
                                      child: Text(
                                        choice,
                                        style: TextStyle(
                                          color: themeColors.textPrimary
                                        )
                                      ),
                                    );
                                  }).toList();
                                }
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
