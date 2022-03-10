import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutterbank/app/models/models.dart';
import 'package:flutterbank/db/app_db.dart';

import 'pages.dart';

const _appTitle = 'Contatos';

class ContactList extends StatelessWidget {
  // final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    // contacts.add(Contact(id: 0, name: 'David', accountNumber: 1234));
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          final List<Contact> contacts = snapshot.data as List<Contact>;
          return ListView.builder(
            itemBuilder: (context, index) {
              final Contact contact = contacts[index];
              return ContactWidget(contact: contact,);
            },
            itemCount: contacts.length,
          );
        },
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
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  final Contact contact;

  const ContactWidget({Key key, this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
