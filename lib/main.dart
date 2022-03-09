import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'app/app_widget.dart';
import 'db/app_db.dart';

void main() {
  runApp(AppWidget());
  // saveContact(Contact(id: 0, name: 'David', accountNumber: 1234)).then((id) {
    findAll().then((contacts) {
      developer.log(contacts.toString());
    });
  // });
}
