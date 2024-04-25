class Account {
  Account({
    required this.name,
    required this.amount,
    required this.type,
  });

  factory Account.fromMap(Map<String, dynamic> json) {
    return Account(
      name: json['name'] as String,
      amount: json['amount'] as double,
      type: json['type'] as int,
    );
  }
  final String name;
  final double amount;
  final int type;

  Map<String, dynamic> toMap() => {
        'name': name,
        'amount': amount,
        'type': type,
      };

  Account adjustAmount(double a) {
    return Account(name: name, amount: amount + a, type: type);
  }

  @override
  String toString() {
    return 'name: $name, account: R ${amount.toStringAsFixed(2)}, type: $type';
  }
}
