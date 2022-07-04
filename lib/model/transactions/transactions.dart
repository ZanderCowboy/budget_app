import 'package:budget_app/model/transactions/transaction_card.dart';
import 'package:flutter/material.dart';

class Transaction {
  final int id;
  final String name;
  final double amount;
  final int type;
  final String date;

  Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
  });

  factory Transaction.fromMap(Map<String, dynamic> json) {
    // 2022-03-21 16:48:27
    final data = json['createdAt'] as String;
    final date = data.split(' ').first;

    // final type = json['type'] as int;

    return Transaction(
        id: json['id'] as int,
        name: json['name'] as String,
        amount: json['amount'] as double,
        // type: type.toBool,
        type: json['type'] as int,
        date: date);
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'amount': amount,
        // 'type': type.toInt,
        'type': type,
      };

  @override
  String toString() {
    return 'id: ' +
        id.toString() +
        ',\n name: ' +
        name.toString() +
        ',\n amount: R' +
        amount.toStringAsFixed(2) +
        ',\n type: ' +
        type.toString() +
        '\n date: ' +
        date.toString();
  }

  Transaction now() {
    return Transaction(
        id: id,
        name: name,
        amount: amount,
        type: type,
        date: DateTime.now().toString());
  }

  Widget toTransactionCard() {
    final amountAdjust = (type == 0) ? amount : -1 * amount;
    return TransactionCard(
        id: id, name: name, amount: amountAdjust, date: date);
  }
}

// extension on bool {
//   int get toInt {
//     if (this == true) return 0;
//     return 1;
//   }
// }
//
// extension on int {
//   bool get toBool {
//     if (this == 0) return true;
//     return false;
//   }
// }
