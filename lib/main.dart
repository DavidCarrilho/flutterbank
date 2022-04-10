import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'app/app_widget.dart';

void main() {
  runApp(AppWidget());
  // save(
  //   Transaction(
  //     value: 200,
  //     contact: Contact(id: 0, name: 'Jorge', accountNumber: 2000),
  //   ),
  // ).then((transaction) => print(transaction));
  // findAll().then((transactions) => developer.log('Nova transações $transactions'));
}
