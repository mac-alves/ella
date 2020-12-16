import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntervalDatePicker extends StatefulWidget {
  
  final String label;
  final String valueInitial;
  final String valueFinal;
  final void Function(String) changeInitial;
  final void Function(String) changeFinal;
  final bool errorInitial;
  final bool errorFinal;

  const IntervalDatePicker({
    Key key, 
    @required this.label,
    @required this.valueInitial,
    @required this.valueFinal,
    @required this.changeInitial,
    @required this.changeFinal,
    @required this.errorInitial,
    @required this.errorFinal,
  }) : super(key: key);

  @override
  _IntervalDatePickerState createState() => _IntervalDatePickerState();
}

class _IntervalDatePickerState extends State<IntervalDatePicker> {
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DatePickerItem(
                change: widget.changeInitial,
                error: widget.errorInitial,
                msgError: 'Data invalida',
                placeholder: 'Data inicial',
                value: widget.valueInitial,
              ),
              SizedBox(
                width: SizeConfig.defaultPadding,
              ),
              DatePickerItem(
                change: widget.changeFinal,
                error: widget.errorFinal,
                msgError: 'Data inválida',
                placeholder: 'Data final',
                value: widget.valueFinal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DatePickerItem extends StatefulWidget {
  
  final void Function(String) change;
  final String value;
  final String msgError;
  final String placeholder;
  final bool error;

  const DatePickerItem({
    Key key,
    @required this.value,
    @required this.change,
    @required this.msgError, 
    @required this.error, 
    @required this.placeholder, 
  }) : super(key: key);

  @override
  _DatePickerItemState createState() => _DatePickerItemState();
}

class _DatePickerItemState extends State<DatePickerItem> {
  
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
    return Expanded(
      child: Column(
        children: [
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
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2099),
                  locale: const Locale('pt', 'BR'),
                  builder: (BuildContext context, Widget child) {
                    return Theme(
                      data: ThemeData.light().copyWith(
                        colorScheme: ColorScheme.light(primary: themeColors.tertiary),
                      ),
                      child: child,
                    );
                  },
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
                      : DateFormat('dd/MM').format(_dateTime),
                    style: TextStyle(
                      fontSize: 14,
                      color: _dateTime == null 
                        ? themeColors.textSecondary
                        : themeColors.textPrimary
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