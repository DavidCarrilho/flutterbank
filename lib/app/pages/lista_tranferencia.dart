import 'package:flutter/material.dart';
import 'package:simplebank/app/components/components.dart';
import 'package:simplebank/app/models/models.dart';
import 'package:simplebank/app/pages/pages.dart';
import 'dart:developer' as developer;

class ListaTransferencia extends StatelessWidget {
  final List<Transferencia> _transferencia = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trnsferências'),
        centerTitle: true,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _transferencia.length,
        itemBuilder: (context, index) {
          final transferencia = _transferencia[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTranferencia();
          }));
          future.then((transferenciaRecebida) {
            developer.log('$transferenciaRecebida');
            _transferencia.add(transferenciaRecebida);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
