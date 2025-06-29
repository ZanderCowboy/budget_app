import 'package:budget_app/core/repositories/interfaces/transaction/i_transaction_repository.dart';
import 'package:budget_app/core/services/implementations/database_service.dart';
import 'package:budget_app/models/database/transaction/transaction.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ITransactionRepository)
class TransactionRepository implements ITransactionRepository {
  TransactionRepository(this.db);

  final DatabaseService db;

  @override
  int createTransaction() {
    db.create<Transaction>(Transaction.empty());
    return 0;
  }

  @override
  Transaction readTransaction() {
    return Transaction.empty();
  }

  @override
  void updateTransaction() {}

  @override
  int deleteTransaction() {
    return 0;
  }
}
