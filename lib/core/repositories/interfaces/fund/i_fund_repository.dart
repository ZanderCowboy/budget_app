import 'package:budget_app/models/database/export_database.dart';

abstract class IFundRepository {
  int createFund();
  Funds readFund();
  void updateFund();
  int deleteFund();
}
