import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@HiveType(typeId: 0)
@freezed
@Collection(ignore: {'copyWith'})
class Account with _$Account {
  factory Account({
    required int id,
    required String name,
    required double amount,
    required int type,
  }) = _Account;

  Account._();

  factory Account.empty() => Account(
        id: 0,
        name: '',
        amount: 0,
        type: 0,
      );

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Id get i => id;
}
