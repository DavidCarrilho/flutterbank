import 'package:flutterbank/app/models/models.dart';

class Transaction {
  final int accountNumber;
  final double value;
  final Contact contact;

  Transaction({
    this.accountNumber,
    this.contact,
    this.value,
  });


  @override
  String toString() => 'Transaction(accountNumber: $accountNumber, value: $value, contact: $contact)';
}
