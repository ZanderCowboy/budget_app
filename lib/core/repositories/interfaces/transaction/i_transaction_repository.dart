import 'package:budget_app/models/database/transaction/transaction.dart';

abstract class ITransactionRepository {
  int createTransaction();
  Transaction readTransaction();
  void updateTransaction();
  int deleteTransaction();
}
