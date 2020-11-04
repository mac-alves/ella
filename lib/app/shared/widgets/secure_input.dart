import 'package:ella/app/shared/utils/constants.dart';
import 'package:flutter/material.dart';

class SecureInput extends StatefulWidget {

  final String label;
  final String placeholder;
  final GestureTapCallback press;

  const SecureInput({
    Key key, 
    @required this.label, 
    @required this.press, 
    @required this.placeholder,
  }) : super(key: key);

  @override
  _SecureInputState createState() => _SecureInputState();
}

class _SecureInputState extends State<SecureInput> {

  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10
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
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: themeColors.textSecondary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: TextField(
              obscureText: secure,
              onChanged: (value) {},
              decoration: InputDecoration(
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
                  vertical: 18
                )
              ),
              style: TextStyle(
                fontSize: 14,
                color: themeColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
