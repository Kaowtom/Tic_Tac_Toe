// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseProvider extends ChangeNotifier {
//   static DatabaseProvider? _instance;
//   Database? _database;

//   DatabaseProvider._internal();

//   factory DatabaseProvider() {
//     if (_instance == null) {
//       _instance = DatabaseProvider._internal();
//     }
//     return _instance!;
//   }

//   Future<void> initDatabase() async {
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'my_database.db');

//     _database = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         // Create the database tables
//         await db.execute(
//             'CREATE TABLE scores (id INTEGER PRIMARY KEY AUTOINCREMENT, player_name TEXT, score INTEGER)');
//       },
//     );
//   }

//   Future<List<Map<String, dynamic>>> getTopScores() async {
//     if (_database == null) {
//       await initDatabase();
//     }
//     return await _database!.rawQuery(
//         'SELECT player_name, SUM(score) as total_score FROM scores GROUP BY player_name ORDER BY total_score DESC LIMIT 10');
//   }

//   Future<int> getScore(String playerName) async {
//     if (_database == null) {
//       await initDatabase();
//     }
//     var result = await _database!.query('scores',
//         columns: ['score'], where: 'player_name = ?', whereArgs: [playerName]);
//     if (result.isNotEmpty) {
//       return result.first['score'] as int;
//     }
//     return 0;
//   }

//   Future<void> updateScore(String playerName, int score) async {
//     if (_database == null) {
//       await initDatabase();
//     }
//     await _database!.rawInsert(
//         'INSERT OR REPLACE INTO scores (player_name, score) VALUES (?, ?)',
//         [playerName, score]);
//   }

//   Database get db {
//     if (_database == null) {
//       throw 'Database not initialized';
//     }
//     return _database!;
//   }
// }
