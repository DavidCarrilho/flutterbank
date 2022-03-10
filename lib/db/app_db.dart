import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/contact_dao.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'flutterbank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    },
    version: 1,

    /// clear db
    // onDowngrade: onDatabaseDowngradeDelete,
    // onUpgrade: (db, oldVersion, newVersion) {
    /// run sql code for upgrade
    // });
  );
}
