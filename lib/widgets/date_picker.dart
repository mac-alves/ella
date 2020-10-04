import 'package:ella/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _dateTime;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: 3
            ),
            alignment: Alignment.centerLeft, 
            child: Text(
              "Data",
              style: TextStyle(
                fontSize: 14,
                color: listsApp.textColor
              ),
            ),
          ),
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: listsApp.primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: FlatButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2021)
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Text(
                    _dateTime == null ? 'Selecione uma data' : DateFormat('dd-MM-yyyy').format(_dateTime),
                    style: TextStyle(
                      fontSize: 14,
                      color: listsApp.textColor
                    )
                  ),
                  Spacer(),
                  Icon(
                    Icons.calendar_today,
                    color: listsApp.iconColor,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}