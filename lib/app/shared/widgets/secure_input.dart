import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class SecureInput extends StatefulWidget {

  final String label;
  final String placeholder;
  final String msgError;
  final void Function(String) change;
  final bool error;
  final bool enable;
  final bool prefixIcon;
  final String value;

  const SecureInput({
    Key key, 
    this.label, 
    @required this.change, 
    @required this.placeholder,
    @required this.msgError,
    @required this.error,
    this.enable = true,
    this.prefixIcon = false,
    this.value,
  }) : super(key: key);

  @override
  _SecureInputState createState() => _SecureInputState();
}

class _SecureInputState extends State<SecureInput> {

  TextEditingController controller;
  bool secure = true;

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
            child: widget.label != null ? Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textSecondary
              ),
            ) : null,
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: themeColors.textSecondary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
              )
            ),
            child: TextField(
              controller: controller,
              obscureText: secure,
              onChanged: widget.change,
              decoration: InputDecoration(
                prefixIcon: widget.prefixIcon ? Icon(
                  Icons.lock_outline,
                  color: themeColors.textSecondary,
                ) : null,
                suffixIcon: IconButton(
                  icon: Icon(
                    !secure ? Icons.visibility : Icons.visibility_off,
                    color: themeColors.textSecondary,
                  ), 
                  onPressed: () {
                    setState((){
                      secure = !secure;
                    });
                  }
                ),
                hintText: widget.placeholder,
                hintStyle: TextStyle(
                  color: themeColors.textSecondary,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 16
                )
              ),
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textSecondary,
              ),
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
