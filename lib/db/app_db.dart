import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void createDataBase() {
  getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'flutterbank.db');
    openDatabase(path, onCreate: (db, version) {
      db.execute(''' 
        CREATE TABLE contacts(
        id INTEGER PRIMARY KEY,
        name TEXT,
        account_number INTEGER)
      ''');
    }, version: 1);
  });
}
