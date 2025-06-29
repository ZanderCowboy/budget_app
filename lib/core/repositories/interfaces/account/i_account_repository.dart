import 'package:budget_app/models/database/account/account.dart';

abstract class IAccountRepository {
  int createAccount();
  Account readAccount();
  void updateAccount();
  int deleteAccount();
}
