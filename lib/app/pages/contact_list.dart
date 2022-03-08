import 'package:flutter/material.dart';
import 'package:flutterbank/app/pages/pages.dart';
import 'dart:developer' as developer;

class ContactList extends StatelessWidget {
  const ContactList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'David',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1234',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then(
                (newContact) => developer.log(newContact.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
