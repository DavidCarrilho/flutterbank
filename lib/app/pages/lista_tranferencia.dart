import 'package:flutter/material.dart';
import 'package:flutterbank/app/components/components.dart';
import 'package:flutterbank/app/models/models.dart';
import 'package:flutterbank/app/pages/pages.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencia = [];

  @override
  _ListaTransferenciaState createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget._transferencia.length,
        itemBuilder: (context, index) {
          final transferencia = widget._transferencia[index];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContactForm();
          })).then(
            (transferenciaRecebida) => _atualiza(transferenciaRecebida),
          );
        },
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencia.add(transferenciaRecebida);
      });
    }
  }
}
