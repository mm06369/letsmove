import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const dbName = "exercise_db.db";
  static const dbVersion = 1;
  static const dbTable = "excersieTable";
  static const columnId = 'id';
  static const columnExerciseId = 'exerciseId';
  static const columnName = 'exerciseName';
  static const columnBodyPart = 'bodyPart';
  static const columnEquipment = 'equipment';
  static const columnGender = 'gender';
  static const columnTarget = 'target';
  static const columnIllustrationId = 'illustrationId';

  static final DatabaseHelper instance = DatabaseHelper();
  static Database? _database;

  Future<Database> get database async {
    debugPrint("Get database called");
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    debugPrint("Initializing the database");
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: onCreate);
  }

  Future<void> loadDatafromCsvAndAddIntoDb() async {
    
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool csvDataImported = prefs.getBool('csvDataImported') ?? false;

    // Open the SQLite database
    if (!csvDataImported) {
      try {
        debugPrint("Reading the csv file and inserting data into sqflite database");
        
        Database db = await instance.database;
        // Read and parse the CSV file
        final String csvString = await rootBundle.loadString('assets/csv/gym_videos_name.csv');
        List<List<dynamic>> csvTable =
            const CsvToListConverter().convert(csvString);

        for (final row in csvTable) {
          await db.insert(
            dbTable,
            {
              columnExerciseId: row[0],
              columnIllustrationId: row[7],
              columnName: row[1],
              columnBodyPart: row[3],
              columnEquipment: row[4],
              columnGender: row[5],
              columnTarget: row[6]
            },
          );
        
        debugPrint("Done adding data into database");

        }
      } catch (e) {
        debugPrint("Error Fetching Database: ${e.toString()}");
      }
    }

    await prefs.setBool('csvDataImported', true);

  }

  Future<void> onCreate(Database db, int version) async {
    
    debugPrint("Creating Database Table");
    db.execute('''
      CREATE TABLE $dbTable (
         $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
         $columnExerciseId INTEGER,
         $columnIllustrationId INTEGER,
         $columnName TEXT,
         $columnBodyPart TEXT,
         $columnEquipment TEXT,
         $columnGender TEXT,
         $columnTarget TEXT

      )
      ''');
    debugPrint("Table Created");
  }

  insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(dbTable, row);
  }

  Future<List<Map<String, dynamic>>> query() async {
    Database db = await instance.database;
    return await db.query(dbTable);
  }
}
