import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'funds.freezed.dart';
part 'funds.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Funds with _$Funds {
  factory Funds({
    required int id,
    required String name,
    required String description,
    required double total,
  }) = _Funds;

  Funds._();

  factory Funds.empty() => Funds(
        id: 0,
        name: '',
        description: '',
        total: 0,
      );

  factory Funds.fromJson(Map<String, dynamic> json) => _$FundsFromJson(json);

  Id get i => id;
}
