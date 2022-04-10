import 'package:flutter/material.dart';
import '../components/components.dart';
import 'transaction_form.dart';

import '../../db/dao/contact_dao.dart';
import '../design_system/colors/colors.dart';
import '../models/models.dart';
import 'pages.dart';

const _appTitle = 'Transferência';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appTitle),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return ProgressWidget(
                message: 'Carregando...',
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return ContactWidget(
                    onClick: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TransactionForm(contact),
                          ),
                        ),
                    contact: contact,
                  );
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Center(
              child: Text(
            'Erro no carregamento!',
            style: TextStyle(
              fontSize: 24.0,
              color: kColorDeepPurple,
              fontWeight: FontWeight.bold,
            ),
          ));
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
                (value) => setState(() {}),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  final Contact contact;
  final Function() onClick;

  const ContactWidget({Key key, this.contact, @required this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onClick,
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
