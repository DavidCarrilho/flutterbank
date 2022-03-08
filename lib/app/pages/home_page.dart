import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

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
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            width: double.infinity,
            color: Colors.purple[100],
            child: Column(
              children: <Widget>[
                FlutterLogo(
                  size: 180.0,
                  colors: Colors.purple,
                ),
                const SizedBox(height: 20.0),
                Text(
                  'FlutterBank',
                  style: TextStyle(color: Colors.deepPurple[900],fontSize: 32.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 120.0,
            width: 100.0,
            child: Column(
              children: <Widget>[
                Icon(Icons.person),
                Text('Contatos'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
