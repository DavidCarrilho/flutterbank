import 'package:flutter/material.dart';
import 'package:simplebank/app/components/components.dart';
import 'package:simplebank/app/models/models.dart';

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
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
