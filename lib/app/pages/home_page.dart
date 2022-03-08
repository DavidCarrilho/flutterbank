import 'package:flutter/material.dart';
import 'package:flutterbank/app/pages/lista_tranferencia.dart';

const _tituloApp = 'Trnsferências';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloApp),
        centerTitle: true,
      ),
      body: ListaTransferencia(),
    );
  }
}
