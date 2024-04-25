import 'package:budget_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class AssetSummary extends StatelessWidget {
  const AssetSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(35)),
        color: Colors.black87,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: secondaryColour,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: const Text(
              'Portfolio Summary',
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: primaryColour,
                color: textColour,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      animationEnabled: portfolioAnimationBool,
                      infoProperties: InfoProperties(
                        topLabelStyle: TextStyle(
                          color: Colors.green.shade600,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        topLabelText: 'Investments',
                        mainLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                        modifier: (double value) {
                          final budget = (value * 100).toStringAsFixed(2);
                          return 'R $budget';
                        },
                      ),
                      customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor: Colors.green[800],
                        progressBarColor: Colors.green[600],
                        dotColor: Colors.green[600],
                      ),
                      customWidths: CustomSliderWidths(progressBarWidth: 10),
                    ),
                    initialValue: 33,
                  ),
                ),
                Expanded(
                  child: SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                      animationEnabled: portfolioAnimationBool,
                      infoProperties: InfoProperties(
                        topLabelStyle: TextStyle(
                          color: Colors.red.shade600,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        topLabelText: 'Debt',
                        mainLabelStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                        ),
                        modifier: (double value) {
                          final budget = (value * 100).toStringAsFixed(2);
                          return 'R $budget';
                        },
                      ),
                      customColors: CustomSliderColors(
                        hideShadow: true,
                        trackColor: Colors.red[800],
                        progressBarColor: Colors.red[600],
                        dotColor: Colors.red[600],
                      ),
                      customWidths: CustomSliderWidths(progressBarWidth: 10),
                    ),
                    initialValue: 33,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
