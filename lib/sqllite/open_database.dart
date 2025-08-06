import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openDatabaseConnection() async {
  WidgetsFlutterBinding.ensureInitialized();
  return await openDatabase(
    join(await getDatabasesPath(), 'superhero_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE heroes(id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT, fullName TEXT)',
      );
    },
    version: 1,
  );
}
