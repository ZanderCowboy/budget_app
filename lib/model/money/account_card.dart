import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'package:budget_app/utils/constants.dart';

class AccountCard extends StatelessWidget {
  static const _investColor = Color(0xFF099A41);
  static const _debtColor = Color(0xFFC51B2C);

  final double _minValue = 0;

  final double investValue;
  final double debtValue;
  final double totalValue;

  const AccountCard({required this.investValue, required this.debtValue, required this.totalValue});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.black,
      margin: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 25),
          child: const Text(
            'Account Summary',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black, //Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                    animationEnabled: portfolioAnimationBool,
                    infoProperties: InfoProperties(
                        topLabelStyle: const TextStyle(
                            color: _investColor, //Colors.green.shade600,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        topLabelText: 'Invest',
                        mainLabelStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300),
                        modifier: (double value) {
                          return 'R${value.toStringAsFixed(2)}';
                        }),
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: _investColor,//Colors.green[800],
                      progressBarColor: _investColor, //Colors.green[600],
                      dotColor: _investColor,//Colors.green[600],
                    ),
                    customWidths: CustomSliderWidths(progressBarWidth: 10)),
                min: _minValue,
                max: totalValue,
                initialValue: investValue,
              ),
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                    animationEnabled: portfolioAnimationBool,
                    infoProperties: InfoProperties(
                        topLabelStyle: const TextStyle(
                            color: _debtColor, //Colors.red.shade600,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                        topLabelText: 'Debt',
                        mainLabelStyle: const TextStyle(
                            color: Colors.black54,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300),
                        modifier: (double value) {
                          return 'R${value.toStringAsFixed(2)}';
                        }),
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: _debtColor, //Colors.red[800],
                      progressBarColor:  _debtColor, //Colors.red[600],
                      dotColor: _debtColor, //Colors.red[600],
                    ),
                    customWidths: CustomSliderWidths(progressBarWidth: 10)),
                min: _minValue,
                max: totalValue,
                initialValue: debtValue,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
