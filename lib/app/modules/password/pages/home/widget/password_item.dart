import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class PasswordItem extends StatefulWidget {

  const PasswordItem({
    Key key,
  }) : super(key: key);

  @override
  _PasswordItemState createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {

  TextEditingController textController;

  bool secure = true;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController.text = 'qweweqwewqsdsa';
  }

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
                width: getPropScreenWidth(65),
                height: 76,
                child: FlatButton(
                  onPressed: (){
                    setState((){
                      secure = !secure;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(
                    !secure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                    size: 33,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: themeColors.tertiary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Netflix',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              color: themeColors.textPrimary
                            )
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 20,
                            child: TextField(
                              enabled: false,
                              controller: textController,
                              obscureText: secure,
                              onChanged: (value) {},
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 15,
                                color: themeColors.textSecondary,
                              ),
                            ),
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
                          onSelected: (String item) {},
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
