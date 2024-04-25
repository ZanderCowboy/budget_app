import 'package:flutter/material.dart';


class AccountCardBlank extends StatelessWidget {
  const AccountCardBlank({super.key});

  // static const _investColor = Color(0xFF099A41);
  // static const _debtColor = Color(0xFFC51B2C);

  // final double _minValue = 0;
  //
  // final double investValue;
  // final double debtValue;
  // final double totalValue;

  // const AccountCard({required this.investValue, required this.debtValue, required this.totalValue});

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
      child: Column(children: <Widget>[
        Container(

        ),

      ],),
    );
  }
}
