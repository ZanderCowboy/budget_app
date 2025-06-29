import 'package:budget_app/models/database/export_database.dart';
import 'package:budget_app/models/enums/box_type.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class InjectableModule {
  @preResolve
  Future<void> get hive async {
    await Hive.initFlutter();

    await Hive.openBox<Account>(BoxType.account.name);
    await Hive.openBox<Funds>(BoxType.funds.name);
    await Hive.openBox<Transaction>(BoxType.transaction.name);
  }

  @preResolve
  Future<Isar> get isar async {
    final directory = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        AccountSchema,
        TransactionSchema,
      ],
      directory: directory.path,
      name: 'BudgetDB',
    );
    return isar;
  }
}
