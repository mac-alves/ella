import 'package:ella/app/modules/money/models/estimate_store.dart';
import 'package:ella/app/shared/utils/constants.dart';
import 'package:ella/app/shared/utils/sizes.dart';
import 'package:flutter/material.dart';

class CardEstimate extends StatelessWidget {

  final EstimateStore estimate;

  const CardEstimate({
    Key key,
    @required this.estimate,
  }) : super(key: key);

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
                'R\$ ${estimate.finalBalance}',
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
                  '${estimate.month}',
                  style: TextStyle(
                    color: themeColors.textPrimary,
                    fontSize: 14,
                  )
                ),
                Text(
                  '${estimate.startDay} - ${estimate.endDay}',
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