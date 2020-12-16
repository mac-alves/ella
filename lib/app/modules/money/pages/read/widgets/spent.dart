import 'package:ella/app/modules/money/models/spent_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../read_controller.dart';

class Spent extends StatefulWidget {
  
  final SpentStore item;
  final Function(String) onPress;
  final bool isExpectedGeneral;
  final bool isFixedEstimate;
  
  const Spent({
    Key key, 
    @required this.item, 
    @required this.onPress,
    this.isExpectedGeneral = false,
    this.isFixedEstimate = true,
  }) : super(key: key);

  @override
  _SpentState createState() => _SpentState();
}

class _SpentState extends State<Spent> {

  ReadController controller = Modular.get<ReadController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.defaultPadding,
            right: SizeConfig.defaultPadding,
            top: SizeConfig.defaultPadding
          ),
          child: Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              color: widget.item.selected ? Colors.transparent : themeColors.tertiary,
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
              onLongPress: () {
                controller.selectToDelete(widget.item.id);
                widget.item.setSelected(true);
              },
              onPressed: (){
                if (widget.item.selected) {
                  controller.removeToDelete(widget.item.id);
                  widget.item.setSelected(false);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.title,
                    style: TextStyle(
                      fontSize: 15,
                      color: themeColors.textPrimary
                    )
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: !widget.isExpectedGeneral,
                        child: Text(
                          'R\$ ${widget.item.value}',
                          style: TextStyle(
                            fontSize: 15,
                            color: themeColors.textPrimary
                          )
                        ),
                      ),
                      Visibility(
                        visible: !widget.isFixedEstimate,
                        child: Container(
                          padding: EdgeInsets.only(left: 3),
                          width: 30,
                          child: PopupMenuButton<String>(
                            captureInheritedThemes: true,
                            color: themeColors.secondary,
                            icon: Icon(
                              Icons.more_vert,
                              color: themeColors.moneyColor,
                            ),
                            onSelected: widget.onPress,
                            itemBuilder: (BuildContext context) {
                              return ['editar'].map((String choice){
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
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}