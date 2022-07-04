import 'package:budget_app/model/funds/funds.dart';
import 'package:budget_app/model/money/account.dart';
import 'package:budget_app/model/transactions/transactions.dart';
import 'package:sqflite/sqflite.dart' as sql;

// 2022-03-21 16:48:27
class SQLHelper {

  static const String _databaseName = 'data.db';
  static const String _accountsTableName = 'accounts';
  static const String _fundsTableName = 'funds';
  static const String _transactionsTableName = 'transactions';

  static const int _income = 0;
  static const int _expense = 1;

  static const int _investment = 0;
  static const int _debt = 1;
  static const int _bank = 2;

  static const String cheque = 'Cheque';
  static const String cash = 'Cash';
  static const String savings = 'Savings';

  static const String investment = 'Investments';
  static const String debt = 'Debt';
  static const String bank = 'Bank';


  static const String _accountsTable =
      """CREATE TABLE IF NOT EXISTS $_accountsTableName (
        name TEXT NOT NULL UNIQUE,
        amount REAL NOT NULL,
        type INTEGER NOT NULL
      )
      """;

  static const String _fundsTable =
      """CREATE TABLE IF NOT EXISTS $_fundsTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        total REAL NOT NULL
      )
      """;

  static const String _transactionsTable =
      """CREATE TABLE IF NOT EXISTS $_transactionsTableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT NOT NULL,
        amount REAL NOT NULL,
        type INTEGER NOT NULL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """;

  static Future<void> _createTables(sql.Database database) async {
    sql.Batch batch = database.batch();

    batch.execute(_accountsTable);
    batch.execute(_fundsTable);
    batch.execute(_transactionsTable);

    await batch.commit(noResult: true);
  }

  static Future<void> _createAccounts(sql.Database database) async {
    sql.Batch batch = database.batch();

    // todo remove value
    const double _initialInvestmentBalance = 1; //1941.49;
    const double _initialDebtBalance = 1; //89316.05 + 6857.01;
    const double _initialBankBalance = 1; //569.57;

    // Investments
    final investAccount =
        Account(name: investment, amount: _initialInvestmentBalance, type: _investment);

    // Debt
    final debtAccount = Account(name: debt, amount: _initialDebtBalance, type: _debt);

    // Bank
    final bankAccount = Account(name: bank, amount: _initialBankBalance, type: _bank);

    batch.insert(_accountsTableName, investAccount.toMap());
    batch.insert(_accountsTableName, debtAccount.toMap());
    batch.insert(_accountsTableName, bankAccount.toMap());

    await batch.commit(noResult: true);
  }

  static Future<void> _createFunds(sql.Database database) async {
    sql.Batch batch = database.batch();

    // Cheque
    final chequeFund = Funds(
      id: 0,
      name: cheque,
      description: ' Money in bank account',
      total: 0,
    );

    // Cash
    final cashFund = Funds(
      id: 0,
      name: cash,
      description: 'Cash on hand',
      total: 0,
    );

    // Savings
    final savingsFund = Funds(
      id: 0,
      name: savings,
      description: 'Money in saving accounts',
      total: 0,
    );

    batch.insert(_fundsTableName, chequeFund.toMap());
    batch.insert(_fundsTableName, cashFund.toMap());
    batch.insert(_fundsTableName, savingsFund.toMap());

    await batch.commit(noResult: true);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      _databaseName,
      version: 1,
      onCreate: (sql.Database database, int version) async {
        // create tables
        await _createTables(database);

        // populate data
        await _createAccounts(database);
        await _createFunds(database);
      },
    );
  }

  // create
  static Future<int> createTransaction(Transaction transaction) async {
    final db = await SQLHelper.db();
    return db.insert(_transactionsTableName, transaction.toMap());
  }

  static Future<int> createFunds(Funds funds) async {
    final db = await SQLHelper.db();
    return db.insert(_fundsTableName, funds.toMap());
  }

  // read
  static Future<Transaction> readTransactions(int id) async {
    final db = await SQLHelper.db();
    final transactionMap = await db.query(_transactionsTableName,
        where: "id = ?", whereArgs: [id], limit: 1);
    return Transaction.fromMap(transactionMap.first);
  }

  static Future<Funds> readFunds(String name) async {
    final db = await SQLHelper.db();
    final fundsMap = await db.query(_fundsTableName,
        where: "name = ?", whereArgs: [name], limit: 1);
    return Funds.fromMap(fundsMap.first);
  }

  static Future<Account> readAccount(String name) async {
    final db = await SQLHelper.db();
    final accountMap = await db.query(_accountsTableName,
        where: "name = ?", whereArgs: [name], limit: 1);
    return Account.fromMap(accountMap.first);
  }


  // update
  static Future<int> updateTransaction(Transaction transaction) async {
    final db = await SQLHelper.db();
    return db.update(_transactionsTableName, transaction.now().toMap(),
        where: "id = ?", whereArgs: [transaction.id]);
  }

  static Future<int> updateFunds(Funds funds) async {
    final db = await SQLHelper.db();
    return db.update(_fundsTableName, funds.toMap(),
        where: "id = ?", whereArgs: [funds.id]);
  }

  static Future<void> updateAccount(Account acc) async {
    final db = await SQLHelper.db();
    await db.update(_accountsTableName, acc.toMap(),
        where: "name = ?", whereArgs: [acc.name]);
  }

  // delete
  static Future<void> deleteTransaction(int id) async {
    final db = await SQLHelper.db();
    await db.delete(_transactionsTableName, where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteFund(int id) async {
    final db = await SQLHelper.db();
    await db.delete(_fundsTableName, where: "id = ?", whereArgs: [id]);
  }

  // all
  static Future<List<Transaction>> getAllTransactions() async {
    final db = await SQLHelper.db();
    final rows = await db.query(_transactionsTableName, orderBy: "id");
    return rows.map((e) => Transaction.fromMap(e)).toList();
  }

  static Future<List<Funds>> getAllFunds() async {
    final db = await SQLHelper.db();
    final rows = await db.query(_fundsTableName, orderBy: "id");
    return rows.map((e) => Funds.fromMap(e)).toList();
  }

  static Future<List<Account>> getAllAccounts() async {
    final db = await SQLHelper.db();
    final rows = await db.query(_accountsTableName);
    return rows.map((e) => Account.fromMap(e)).toList();
  }

}
