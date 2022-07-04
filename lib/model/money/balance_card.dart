import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double cash;
  final String name;

  BalanceCard({required this.name,required this.cash});

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
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Text(
            name,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black, //Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'R ${cash.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.black, //Colors.white,
            fontSize: 25,
            // fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 25),
      ]),
    );
  }
}
