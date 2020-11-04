import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  
  final String label;
  final String placeholder;
  final String value;
  final void Function(String) change;
  final String msgError;
  final bool error;

  const DatePicker({
    Key key, 
    @required this.label,
    @required this.placeholder,
    @required this.value,
    @required this.change,
    @required this.msgError, 
    @required this.error, 
  }) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  
  DateTime _dateTime;
  
  @override
  void initState() {
    super.initState();

    if (widget.value != null) {
      List<int> date = widget.value
        .split('/')
        .map((e) => int.parse(e))
        .toList();

      _dateTime = new DateTime(date[0], date[1], date[2]);
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
        children: <Widget>[
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
              color: themeColors.tertiary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: themeColors.textSecondary
              )
            ),
            child: FlatButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2021)
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      _dateTime = date;
                    });

                    widget.change(DateFormat('yyyy/MM/dd').format(date));
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Text(
                    _dateTime == null 
                      ? widget.placeholder 
                      : DateFormat('dd/MM/yyyy').format(_dateTime),
                    style: TextStyle(
                      fontSize: 14,
                      color: themeColors.textSecondary
                    )
                  ),
                  Spacer(),
                  Icon(
                    Icons.calendar_today,
                    color: themeColors.textSecondary,
                    size: 25,
                  ),
                ],
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