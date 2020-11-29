
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class InputSwitch extends StatelessWidget {

  final String title;
  final bool selected;
  final bool disable;
  final Function(bool) change;

  const InputSwitch({
    Key key,
    @required this.title,
    @required this.change,
    this.selected = false,
    this.disable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeConfig.defaultPadding,
        right: SizeConfig.defaultPadding / 2,
        top: SizeConfig.defaultPadding / 2,
        // bottom: 10
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: getPropScreenWidth(16),
                  color: themeColors.textSecondary,
                ),
              ),
            ),
          ),
          AbsorbPointer(
            absorbing: disable,
            child: Container(
              child: Switch(
                value: selected,
                onChanged: change,
                activeColor: !disable ? themeColors.moneyColor : themeColors.tertiary,
                inactiveTrackColor: themeColors.tertiary,
                inactiveThumbColor: !disable ? themeColors.textPrimary : themeColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}