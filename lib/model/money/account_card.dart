import 'package:budget_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

part 'widgets/invest_circular_slider.dart';
part 'widgets/debt_circular_slider.dart';

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
                const _InvestCircularSlider(investColor: _investColor),
                _DeptCircularSlider(
                  debtColor: _debtColor,
                  minValue: minValue,
                  maxValue: totalValue,
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
