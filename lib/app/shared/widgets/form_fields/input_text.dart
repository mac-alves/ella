import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  
  final String label;
  final void Function(String) change;
  final String placeholder;
  final String msgError;
  final String value;

  const InputText({
    Key key, 
    @required this.label, 
    @required this.change, 
    @required this.placeholder,
    @required this.msgError,
    this.value,
  }) : super(key: key);

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {

  bool error = false;

  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
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
          Container(
            padding: EdgeInsets.only(
              bottom: 3
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textSecondary,
              ),
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: themeColors.tertiary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
              )
            ),
            child: TextFormField(
              controller: controller,
              textCapitalization: TextCapitalization.sentences,
              onChanged: widget.change,
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
                setState(() {
                  if (value.isEmpty) {
                    error = true;
                  } else {
                    error = false;
                  }
                });

                return value.isEmpty ? '' : null;
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 5,
            ),
            alignment: Alignment.centerLeft,
            child: !error ? null : Text(
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