import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyInput extends StatefulWidget {

  final String label;
  final String placeholder;
  final String msgError;
  final String value;
  final bool enable;
  final void Function(String) change;

  const MoneyInput({
    Key key, 
    this.label, 
    @required this.change, 
    @required this.placeholder,
    @required this.msgError,
    this.enable = true,
    this.value,
  }) : super(key: key);

  @override
  _MoneyInputState createState() => _MoneyInputState();
}

class _MoneyInputState extends State<MoneyInput> {

  bool error = false;

  MoneyMaskedTextController controller;

  @override
  void initState() {
    super.initState();
    controller = new MoneyMaskedTextController(
      decimalSeparator: '.',
      thousandSeparator: ',',
      precision: 2
    );

    controller.text = widget.value;
  }

  @override
  void dispose() {
    super.dispose();
    
    if (controller.dispose != null){
      controller.dispose();
    }
  }

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
          Visibility(
            visible: widget.label != null, 
            child: Container(
              padding: EdgeInsets.only( 
                bottom: 3
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                widget.label != null
                  ? widget.label
                  : '',
                style: TextStyle(
                  fontSize: 14,
                  color: themeColors.textSecondary
                ),
              ),
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: widget.enable ? themeColors.tertiary : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
              )
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                widget.change(controller.numberValue.toString());
              },
              textAlign: TextAlign.right,
              enabled: widget.enable,
              decoration: InputDecoration(
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: themeColors.textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: SizeConfig.defaultPadding,
                  right: SizeConfig.defaultPadding,
                  top: 3,
                )
              ),
              style: TextStyle(
                fontSize: 15,
                color: themeColors.textPrimary,
              ),
              validator: (value) {
                if (!widget.enable) {
                  return null;
                }

                setState(() {
                  if (value == '0.00') {
                    error = true;
                  } else {
                    error = false;
                  }
                });

                return (value == '0.00') ? '' : null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 5,
            ),
            alignment: Alignment.centerLeft,
            child: !widget.enable 
              ? null 
              : !error ? null : Text(
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