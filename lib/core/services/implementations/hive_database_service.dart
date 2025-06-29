import 'package:budget_app/core/services/implementations/mixins/hive_mixin.dart';
import 'package:budget_app/core/services/interfaces/database_service_mixin.dart';
import 'package:budget_app/models/database/export_database.dart';
import 'package:budget_app/models/enums/box_type.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HiveDbService with DatabaseServiceMixin, HiveMixin {
  // HiveDbService(this.db);

  // final HiveInterface db;

  @override
  void create<T>(T object) {
    Hive.box<T>(_getType(T)).add(object);
  }

  @override
  void read<T>(int object) {
    Hive.box<T>(_getType(T)).get(object);
  }

  @override
  void update<T>(T object) {}

  @override
  void delete<T>(int object) {
    Hive.box<T>(_getType(T)).delete(object);
  }
}

String _getType<T>(T type) {
  switch (T) {
    case Account _:
      return BoxType.account.name;
    case Funds _:
      return BoxType.funds.name;
    case Transaction _:
      return BoxType.transaction.name;
    default:
  }
  return '';
}
