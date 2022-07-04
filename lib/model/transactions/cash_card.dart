import 'package:flutter/material.dart';

class CashCard extends StatelessWidget {
  final double cash;

  CashCard({required this.cash});

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
            'Cash Balance',
            style: TextStyle(
              // decoration: TextDecoration.underline,
              color: Colors.black, //Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          'R ${cash.toStringAsFixed(2)}',
          style: TextStyle(
            color: Colors.black, //Colors.white,
            fontSize: 25,
            // fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 25),
      ]),
    );
  }
}
