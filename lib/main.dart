import 'package:flutter/material.dart';
import 'package:flutterbank/app/app_widget.dart';
import 'package:flutterbank/app/models/models.dart';
import 'package:flutterbank/db/app_db.dart';
import 'dart:developer' as developer;

void main() {
  runApp(AppWidget());
  // saveContact(Contact(id: 0, name: 'David', accountNumber: 1234)).then((id) {
    findAll().then((contacts) {
      developer.log(contacts.toString());
    });
  // });
}
