import 'package:budget_app/model/funds/funds_card.dart';
import 'package:flutter/material.dart';

class Funds {

  Funds({
    required this.id,
    required this.name,
    required this.description,
    required this.total,
  });

  factory Funds.fromMap(Map<String, dynamic> json) {
    return Funds(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      total: json['total'] as double,
    );
  }
  final int id;
  final String name;
  final String description;
  final double total;

  bool isNull() {
    if (name == '' || description == '' || total == 0) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'total': total,
      };

  Funds adjustAmount(double amount) {
    return Funds(id: id, name: name, description: description, total: total + amount);
  }

  Widget toFundsCard() {
    return FundsCard(funds: this);
  }
}
