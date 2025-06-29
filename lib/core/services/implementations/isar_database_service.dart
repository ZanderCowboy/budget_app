import 'package:budget_app/core/services/implementations/mixins/isar_mixin.dart';
import 'package:budget_app/core/services/interfaces/database_service_mixin.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable()
class IsarDbService with DatabaseServiceMixin, IsarMixin {
  IsarDbService(this.db);

  final Isar db;

  @override
  Future<void> create<T>(T object) async {
    final collection = db.collection<T>();

    await db.writeTxn(() async {
      return collection.put(object);
    });
  }

  @override
  Future<void> read<T>(int object) async {
    final collection = db.collection<T>();

    await db.writeTxn(() async {
      return collection.get(object);
    });
  }

  @override
  void update<T>(T object) {}

  @override
  Future<void> delete<T>(int object) async {
    final collection = db.collection<T>();

    await db.writeTxn(() async {
      return collection.delete(object);
    });
  }
}
