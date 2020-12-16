import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardEstimate extends StatefulWidget {

  final EstimateStore estimate;
  final bool notFound;

  const CardEstimate({
    Key key,
    @required this.estimate,
    this.notFound = true,
  }) : super(key: key);

  @override
  _CardEstimateState createState() => _CardEstimateState();
}

class _CardEstimateState extends State<CardEstimate> {

  String strDateInitial = '';
  String strDateFinal = '';

  setThePeriod(){
    if (!widget.notFound) {
      List<int> dateInitial = widget.estimate.startDay
        .split('/')
        .map((e) => int.parse(e))
        .toList();
      
      List<int> dateFinal = widget.estimate.endDay
        .split('/')
        .map((e) => int.parse(e))
        .toList();

      strDateInitial = DateFormat('dd/MM').format(
        new DateTime(dateInitial[0], dateInitial[1], dateInitial[2])
      );

      strDateFinal = DateFormat('dd/MM').format(
        new DateTime(dateFinal[0], dateFinal[1], dateFinal[2])
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setThePeriod();
  }

  @override
  void didUpdateWidget(covariant CardEstimate oldWidget) {
    super.didUpdateWidget(oldWidget);
    bool startDateUpd = widget.estimate.startDay != oldWidget.estimate.startDay;
    bool endDateUpd = widget.estimate.endDay != oldWidget.estimate.endDay;

    if (startDateUpd || endDateUpd) {
      setThePeriod();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: themeColors.moneyColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10)
        ),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/card-back.png",
          ),
          fit: BoxFit.contain
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children:[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/mastercard.png",
              height: getPropScreenWidth(30),
              fit: BoxFit.cover
            ),
          ),
          Positioned(
            top: getPropScreenWidth(40),
            left: 0,
            child: Image.asset(
              "assets/images/card-magn.png",
              height: getPropScreenWidth(30),
              fit: BoxFit.cover
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'R\$ ${widget.estimate.finalBalance}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                )
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.estimate.month}',
                  style: TextStyle(
                    color: themeColors.textPrimary,
                    fontSize: 14,
                  )
                ),
                Text(
                  widget.notFound 
                    ? 'Não há orçamento(s)'
                    : '$strDateInitial - $strDateFinal',
                  style: TextStyle(
                    color: themeColors.textPrimary,
                    fontSize: 11,
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}