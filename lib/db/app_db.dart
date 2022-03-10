import '../app/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'flutterbank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    version: 1,
    /// clear db
    // onDowngrade: onDatabaseDowngradeDelete,
    // onUpgrade: (db, oldVersion, newVersion) {
    //   // run sql code for upgrade
    // });
  );
}

Future<int> saveContact({Contact contact}) async {
  final Database db = await getDataBase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final Database db = await getDataBase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      id: row['id'],
      name: row['name'],
      accountNumber: row['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}
