import 'package:budget_app/core/services/implementations/hive_database_service.dart';
import 'package:budget_app/core/services/interfaces/database_service_mixin.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DatabaseService with DatabaseServiceMixin {
  DatabaseService(this.db);

  final HiveDbService db;
  // final IsarDbService db;

  @override
  void create<T>(T object) {
    db.create<T>(object);
  }

  @override
  void read<T>(int object) {
    db.read<T>(object);
  }

  @override
  void update<T>(T object) {
    db.update<T>(object);
  }

  @override
  void delete<T>(int object) {
    db.delete<T>(object);
  }
}
