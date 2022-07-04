// //  https://www.tutorialkart.com/flutter/flutter-sqlite-tutorial/
// //  https://medium.com/flutter-community/using-sqlite-in-flutter-187c1a82e8b
//
// import 'package:budget_app/utils/constants.dart';
// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class DatabaseManager {
//   // DatabaseManager._() {
//   //   // _database = _initDatabase() as Database;
//   // }
//   //
//   // static final DatabaseManager db = DatabaseManager._();
//   //
//   // static Database _database;
//   //
//   // Future<Database> get database async {
//   //   if (_database != null) {
//   //     return _database;
//   //   } else {
//   //     _database = await _initDatabase();
//   //     return _database;
//   //   }
//   // }
//   //
//   // Future<Database> _initDatabase() async {
//   //   String path = join(await getDatabasesPath(), dbName);
//   //   return await openDatabase(path, version: dbVersion, singleInstance: true);
//   // }
//
//
//   static Future<void> _createTables(Database database) async {
//     Batch batch = database.batch();
//
//     batch.execute(transactionsTable);
//     batch.execute(moneyTable);
//     batch.execute(fundsTable);
//     batch.execute(historyTable);
//
//     await batch.commit(noResult: true);
//   }
//
//   // static Future<void> updateHistoryTable() async {
//   //   final db = await DatabaseManager.db();
//   //   try {
//   //     final result = await db.rawQuery(getAllTables);
//   //     final tableList = result.map((e) => e['name'].toString()).toList();
//   //     final transList = tableList.where((element) => element.contains('transactions_'))
//   //         .toList();
//   //   } catch (err) {
//   //     debugPrint("Something went wrong when deleting an item: $err");
//   //   }
//   // }
//
//   static Future<Database> db() async {
//     String dbPath = join(await getDatabasesPath(), dbName);
//     return openDatabase(
//       dbPath,
//       version: 1,
//       onCreate: (Database database, int version) async {
//         await _createTables(database);
//       },
//       // onOpen: _
//     );
//   }
// }
