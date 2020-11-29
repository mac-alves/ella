import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/list_of_months.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class DropDownSelect extends StatefulWidget {
  
  final String label;
  final String placeholder;
  final List<ItemSelect> itens;
  final void Function(String) change;
  final String value;
  final String msgError;
  final bool error;
  final bool disable;

  DropDownSelect({
    Key key,
    @required this.label,
    @required this.placeholder,
    @required this.itens,
    @required this.change,
    @required this.value,
    @required this.msgError, 
    this.error = false,
    this.disable = false, 
  }) : super(key: key);

  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelect> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.defaultPadding / 2,
        left: SizeConfig.defaultPadding,
        right: SizeConfig.defaultPadding,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 3
            ),
            alignment: Alignment.centerLeft, 
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textSecondary
              ),
            ),
          ),
          AbsorbPointer(
            absorbing: widget.disable,
            child: Container(
              padding: EdgeInsets.only(
                left: SizeConfig.defaultPadding,
                top: 2,
                right: 10
              ),
              height: 56,
              decoration: BoxDecoration(
                color: widget.disable 
                    ? Colors.transparent
                    : themeColors.tertiary,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: themeColors.textSecondary
                )
              ),
              child: DropdownButton<String>(
                hint: Text(
                  widget.placeholder,
                  style: TextStyle(
                    color: themeColors.textSecondary,
                    fontSize: 14
                  ),
                ),
                isExpanded: true,
                value: widget.value,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: themeColors.textSecondary,
                ),
                iconSize: 34,
                elevation: 16,
                style: TextStyle(
                  fontSize: 14,
                  color: themeColors.textSecondary,
                ),
                underline: Container(
                  height: 0,
                ),
                onChanged: widget.change,
                items: widget.itens.map<DropdownMenuItem<String>>((ItemSelect item) {
                  return DropdownMenuItem<String>(
                    value: item.id,
                    child: Text(
                      item.name,
                      style: TextStyle(
                        color: themeColors.textPrimary
                      ),
                    ),
                  );
                }).toList(),
              )
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 5,
            ),
            alignment: Alignment.centerLeft,
            child: !widget.error ? null : Text(
              widget.msgError,
              style: TextStyle(
                fontSize: 12,
                color: Colors.red[600]
              ),
            ),
          ),
        ],
      ),
    );
  }
}