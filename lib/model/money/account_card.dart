import 'package:budget_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AccountCard extends StatelessWidget {
  const AccountCard({
    required this.investValue,
    required this.debtValue,
    required this.totalValue,
    this.minValue = 0,
    super.key,
  });
  static const _investColor = Color(0xFF099A41);
  static const _debtColor = Color(0xFFC51B2C);

  final double minValue;

  final double investValue;
  final double debtValue;
  final double totalValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 10,
      color: Colors.white,
      shadowColor: Colors.black,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: const Text(
              'Account Summary',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
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
                        color: _investColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      topLabelText: 'Invest',
                      mainLabelStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                      modifier: (double value) {
                        return 'R${value.toStringAsFixed(2)}';
                      },
                    ),
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: _investColor,
                      progressBarColor: _investColor,
                      dotColor: _investColor,
                    ),
                    customWidths: CustomSliderWidths(progressBarWidth: 10),
                  ),
                  min: minValue,
                  max: totalValue,
                  initialValue: investValue,
                ),
                SleekCircularSlider(
                  appearance: CircularSliderAppearance(
                    animationEnabled: portfolioAnimationBool,
                    infoProperties: InfoProperties(
                      topLabelStyle: const TextStyle(
                        color: _debtColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      topLabelText: 'Debt',
                      mainLabelStyle: const TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                      ),
                      modifier: (double value) {
                        return 'R${value.toStringAsFixed(2)}';
                      },
                    ),
                    customColors: CustomSliderColors(
                      hideShadow: true,
                      trackColor: _debtColor,
                      progressBarColor: _debtColor,
                      dotColor: _debtColor,
                    ),
                    customWidths: CustomSliderWidths(progressBarWidth: 10),
                  ),
                  min: minValue,
                  max: totalValue,
                  initialValue: debtValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
