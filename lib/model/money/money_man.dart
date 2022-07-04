import 'package:budget_app/model/funds/funds.dart';
import 'package:budget_app/model/money/account.dart';
import 'package:budget_app/model/transactions/transactions.dart';
import 'package:budget_app/utils/db/sql_helper.dart';

class MoneyMan {
  static Future<double> newTransaction(Transaction trans) async {
    final cashFund = await SQLHelper.readFunds(SQLHelper.cheque);
    final amount = (trans.type == 0) ? trans.amount : -1 * trans.amount;
    final newCashFund = Funds(
        id: cashFund.id,
        name: cashFund.name,
        description: cashFund.description,
        total: cashFund.total + amount);

    SQLHelper.updateFunds(newCashFund);
    adjustFunds();
    return newCashFund.total;
  }

  static Future<void> adjustFunds() async {
    final bankAccount = await SQLHelper.readAccount(SQLHelper.bank);
    final funds = await SQLHelper.getAllFunds();

    final totalFundsAmount = funds
        .map((e) => e.total)
        .toList()
        .fold<double>(0, (acc, elem) => acc + elem);

    final newBankAccount = Account(
        name: bankAccount.name,
        amount: totalFundsAmount,
        type: bankAccount.type);
    // final newBankAccount = bankAccount.adjustAmount(totalFundsAmount);
    SQLHelper.updateAccount(newBankAccount);
  }

  static Future<void> adjustCheque(double a) async {
    final chequeFund = await SQLHelper.readFunds(SQLHelper.cheque);
    final newChequeFund = chequeFund.adjustAmount(a);
    SQLHelper.updateFunds(newChequeFund);
  }

  static Future<void> transferFunds(Funds from, Funds to, double amount) async {
    // From
    final fromFund = from.adjustAmount(-1 * amount);
    SQLHelper.updateFunds(fromFund);

    // To
    final toFund = to.adjustAmount(amount);
    SQLHelper.updateFunds(toFund);
  }

  static Future<void> transferAccount(Account from, Account to, double amount) async {
    // From
    final fromAccount = from.adjustAmount(-1 * amount);
    SQLHelper.updateAccount(fromAccount);

    if (from.name == SQLHelper.bank) {
      adjustCheque(-1 * amount);
    }

    // To
    final toAccount = to.adjustAmount(amount);
    SQLHelper.updateAccount(toAccount);

    if (to.name == SQLHelper.bank) {
      adjustCheque(amount);
    }
  }
}

// @todo
// 1. finish balance card => card to show bank/wallet? balance
// 2. money man to make balances for money entries available
// 3. fund man => trans amount from one fund to another (money man?)
// 4. Implement the edit button on transactions and funds
// 5. clean up code
