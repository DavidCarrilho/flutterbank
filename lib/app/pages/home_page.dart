import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trnsferências'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('100.0'),
              subtitle: Text('1000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('500.0'),
              subtitle: Text('2000'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
