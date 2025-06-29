import 'package:budget_app/core/repositories/interfaces/fund/i_fund_repository.dart';
import 'package:budget_app/core/services/implementations/database_service.dart';
import 'package:budget_app/models/database/funds/funds.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFundRepository)
class FundRepository implements IFundRepository {
  FundRepository(this.db);

  final DatabaseService db;

  @override
  int createFund() {
    return 0;
  }

  @override
  Funds readFund() {
    return Funds.empty();
  }

  @override
  void updateFund() {}

  @override
  int deleteFund() {
    return 0;
  }
}
