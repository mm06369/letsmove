import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadData {
  const LoadData();

  Future<void> importCSVToDatabase(String csvFilePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool csvDataImported = prefs.getBool('csvDataImported') ?? false;

    // Open the SQLite database
    if (!csvDataImported) {
      try {
        final database = await openDatabase(
          join(await getDatabasesPath(), 'exercise_database.db'),
          onCreate: (db, version) {
            // Create the table to store CSV data
            db.execute(
              'CREATE TABLE gymVideoName(id INTEGER PRIMARY KEY AUTOINCREMENT, excersiceId INTEGER, exerciseName TEXT, bodyPart TEXT, equipment TEXT);',
            );
          },
          version: 1,
        );

        // Read and parse the CSV file
        final String csvString = await File(csvFilePath).readAsString();
        List<List<dynamic>> csvTable =
            const CsvToListConverter().convert(csvString);

        // Insert data into the SQLite database
        for (final row in csvTable) {
          await database.insert(
            'gymVideoName',
            {
              'exerciseId': row[0],
              'exerciseName': row[1],
            },
          );
        }
      } catch (e) {
        print("error loading database: ${e.toString()}");
      }
    }

    await prefs.setBool('csvDataImported', true);
  }
}
