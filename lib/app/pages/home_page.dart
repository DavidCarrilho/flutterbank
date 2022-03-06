import 'package:flutter/material.dart';
import 'package:simplebank/app/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormularioTranferencia(),
    );
  }
}