import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static Database? _database;

  static final _usersTable = 'users';
  static final _balanceTable = 'balance';

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'maly.db'); // Change the database name to "maly.db"

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_usersTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            number TEXT,
            personalCard TEXT,
            password TEXT,
            photo1 TEXT,
            photo2 TEXT,
            photo3 TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE $_balanceTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            balance REAL,
            FOREIGN KEY (userId) REFERENCES $_usersTable (id)
          )
        ''');
      },
    );
  }

  static Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.insert(_usersTable, user);
  }
  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query(_usersTable);
  }

  static Future<Map<String, dynamic>?> getUserByPhoneNumberAndPassword(
      String phoneNumber, String password) async {
    final db = await database;
    final result = await db.query(
      _usersTable,
      where: 'number = ? AND password = ?',
      whereArgs: [phoneNumber, password],
      limit: 1,
    );
    return result.isNotEmpty ? result.first as Map<String, dynamic>? : null;
  }
  static Future<void> deleteUser(int userId) async {
    final Database db = await openDatabase('maly.db');
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [userId],
    );

  }

}