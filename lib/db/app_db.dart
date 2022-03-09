import 'package:flutterbank/app/models/models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDataBase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'flutterbank.db');
    return openDatabase(path,
        onCreate: (db, version) {
          db.execute('CREATE TABLE contacts('
              'id INTEGER PRIMARY KEY, '
              'name TEXT, '
              'account_number INTEGER)');
        },
        version: 1,
        onUpgrade: (db, oldVersion, newVersion) {
          // run sql code for upgrade
        });
  });
}

Future<int> saveContact(Contact contact) {
  return createDataBase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<List<Contact>> findAll() {
  return createDataBase().then(
    (db) {
      return db.query('contacts').then(
        (maps) {
          final List<Contact> contacts = [];
          for (Map<String, dynamic> map in maps) {
            final Contact contact = Contact(
              id: map['id'],
              name: map['name'],
              accountNumber: map['account_number'],
            );
            contacts.add(contact);
          }
          return contacts;
        },
      );
    },
  );
}
