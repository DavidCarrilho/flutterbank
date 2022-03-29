import 'package:flutter/material.dart';
import 'package:flutterbank/app/models/models.dart';
import 'package:flutterbank/http/web_client.dart';

import 'app/app_widget.dart';
import 'dart:developer' as developer;

void main() {
  runApp(AppWidget());
  // save(
  //   Transaction(
  //     value: 200,
  //     contact: Contact(id: 0, name: 'Jorge', accountNumber: 2000),
  //   ),
  // ).then((transaction) => print(transaction));
  findAll().then((transactions) => developer.log('Nova transações $transactions'));
}
