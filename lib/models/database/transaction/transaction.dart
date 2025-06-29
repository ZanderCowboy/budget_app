import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Transaction with _$Transaction {
  factory Transaction({
    required int id,
    required String name,
    required double amount,
    required int type,
    required DateTime date,
  }) = _Transaction;

  Transaction._();

  factory Transaction.empty() => Transaction(
        id: 0,
        name: '',
        amount: 0,
        type: 0,
        date: DateTime.now(),
      );

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Id get i => id;
}
