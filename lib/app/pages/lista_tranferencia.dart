import 'package:flutter/material.dart';
import 'package:simplebank/app/components/components.dart';
import 'package:simplebank/app/models/models.dart';
import 'package:simplebank/app/pages/pages.dart';
import 'dart:developer' as developer;

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trnsferências'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTranferencia();
          }));
          future.then((transferenciaRecebida) {
            developer.log('$transferenciaRecebida');
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
