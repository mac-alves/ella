import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:ella/app/shared/widgets/secure_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../password_routes.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 120),
              Stack(
                alignment: Alignment.topCenter,
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    "assets/images/logo-money.png",
                    height: getPropScreenWidth(160),
                    fit: BoxFit.cover
                  ),
                  Positioned(
                    bottom: -38,
                    child: Row(
                      children: [
                        Text(
                          'Login',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 27,
                            color: themeColors.passwordColor,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 5,
                          width: 127,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: themeColors.passwordColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              SecureInput(
                placeholder: 'Senha',
                change: (value){},
                msgError: controller.msgErroPassword,
                value: controller.password,
                error: controller.erroPassword,
                prefixIcon: true,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.defaultPadding,
                    left: SizeConfig.defaultPadding,
                    right: SizeConfig.defaultPadding,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: BoxDecoration(
                      color: themeColors.passwordColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: themeColors.tertiary
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 2),
                          blurRadius: 3,
                          color: Colors.black.withOpacity(0.16),
                        ),
                      ],
                    ),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed('$PASSWORD_HOME');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        'Entrar',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 18,
                          color: themeColors.textPrimary
                        )
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}
