import 'package:budget_app/core/repositories/interfaces/account/i_account_repository.dart';
import 'package:budget_app/core/services/implementations/database_service.dart';
import 'package:budget_app/models/database/account/account.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAccountRepository)
class AccountRepository implements IAccountRepository {
  AccountRepository(this.db);

  final DatabaseService db;

  @override
  int createAccount() {
    db.create<Account>(Account.empty());
    return 0;
  }

  @override
  Account readAccount() {
    return Account.empty();
  }

  @override
  void updateAccount() {}

  @override
  int deleteAccount() {
    return 0;
  }
}
