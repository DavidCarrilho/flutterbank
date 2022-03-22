import 'package:flutter/material.dart';
import 'package:flutterbank/http/web_client.dart';

import 'app/app_widget.dart';
import 'dart:developer' as developer;

void main() {
  runApp(AppWidget());
  findAll().then((transaction) => developer.log('Nova transação $transaction'));
}
