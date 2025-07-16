import 'dart:convert';
import 'dart:developer';

import 'package:path/path.dart';
import 'package:shoppe/model/login_response_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? appDB;
  // Create or get the database
  static Future<Database> getDatabase() async {
    if (appDB != null) return appDB!;

    // Define path
    final directory = await getDatabasesPath();
    String path = join(directory, 'my_database.db');
    print('DB Path: ${await getDatabasesPath()}');

    // Open database
    appDB = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        ///Create customer table
        await db.execute('''
          CREATE TABLE USER (
            id INTEGER PRIMARY KEY,
            username TEXT NOT NULL,
            email TEXT,
            firstName TEXT,
            lastName TEXT,
            gender TEXT,
            image TEXT,
            accessToken TEXT,
            refreshToken TEXT
          )
        ''');
      },
    );
    log("Table Created Successfully");
    return appDB!;
  }

  // Insert data
  static Future<void> insertData(LoginResponseModel model) async {
    final appDB = await getDatabase();
    appDB.insert("USER", model.toJson());
  }

  // Read all data
  static readData() async {
    final appDB = await getDatabase();
    return await appDB.query("USER");
  }
}
