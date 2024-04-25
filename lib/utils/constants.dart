import 'dart:core';

import 'package:flutter/material.dart';

// DEFAULT NAMES
const String nameOfApp = 'Budget App';
const String drawerHome = 'Home';
const String drawerFunds = 'Funds';
const String drawerTransactions = 'Transaction';
const String drawerSettings = 'Settings';

// DEFAULT ROUTES
const String rootRoute = '/';
const String fundsRoute = '/funds';
const String transactionsRoute = '/transactions';
const String transferRoute = '/transfer';

// DEFAULT COLOUR
// https://www.color-hex.com/color-palette/28549
const Color primaryColor = Color(0xFF2697FF);
const Color secondaryColor = Color(0xFF2A2D3E);
const Color backgroundColor = Color(0xFF263238);
// const Color backgroundColor = Color(0xFF212332);
const Color textColour = Color(0xFF7289DA);
const Color backgroundColour = Color(0xFF424549);
const Color primaryColour = Color(0xFF36393E);
const Color secondaryColour = Color(0xFF282B30);
const Color appbarColour = Color(0xFF1E2124);

// DATABASE VARIABLES
const String dbName = 'budget_app.db';
const int dbVersion = 1;
const String transactionsTableName = 'transactions';

// DEFAULT VALUES
const double defaultPadding = 50;
const double defaultMargin = 15;
const bool portfolioAnimationBool = false;

// DEFAULT TRANSACTIONS TYPE
const int income = 0;
const int expense = 1;

// DEFAULT FUNDS TYPE
// const int other = 0;
// const int investment = 1;
// const int debt = 2;

// DEFAULT FUNDS
// const String cheque = 'Cheque';
// const String cash = 'Cash';
// const String savings = 'Savings';

// DEFAULT QUERY COMMANDS
// const String getAllTables =
//     """SELECT name FROM sqlite_master WHERE type = 'table' AND name != 'android_metadata' AND name != 'sqlite_sequence'""";
//
// // DEFAULT TABLE CREATION COMMANDS
// const String moneyTable = """CREATE TABLE IF NOT EXISTS money (
//         name TEXT NOT NULL UNIQUE,
//         amount REAL NOT NULL,
//         type INTEGER NOT NULL
//       )
//       """;

// const String historyTable = """CREATE TABLE IF NOT EXISTS history (
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         name TEXT NOT NULL
//       )
//       """;

// const String fundsTable = """CREATE TABLE IF NOT EXISTS funds (
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         name TEXT NOT NULL,
//         description TEXT NOT NULL,
//         total REAL NOT NULL
//       )
//       """;
//
// const String transactionsTable = """CREATE TABLE IF NOT EXISTS transactions (
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         name TEXT NOT NULL,
//         amount REAL NOT NULL,
//         createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//       )
//       """;

// String transactionsTable() {
//   DateTime currentTime = DateTime.now();
//   String currentMonth = DateFormat("MMMM").format(currentTime).toLowerCase();
//   String currentYear = DateFormat("yyyy").format(currentTime).toLowerCase();
//   return """CREATE TABLE IF NOT EXISTS transactions_${currentMonth}_$currentYear (
//         id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
//         name TEXT NOT NULL,
//         amount REAL NOT NULL,
//         createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//       )
//       """;
// }

// final database = await db;
// final data = await database.rawQuery('SELECT * FROM User');
// final lastId = data.last['userId'];
//
// db.query(
// dbTable,
// orderBy: "userId DESC",
// limit: 1
// );
