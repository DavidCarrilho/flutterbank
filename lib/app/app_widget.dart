import 'package:flutter/material.dart';
import 'package:simplebank/app/pages/lista_tranferencia.dart';
import 'package:simplebank/app/pages/pages.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleBank',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ListaTransferencia(),
    );
  }
}
