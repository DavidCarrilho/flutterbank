import 'models.dart';

class Transaction {
  final int accountNumber;
  final double value;
  final Contact contact;

  Transaction({
    this.accountNumber,
    this.contact,
    this.value,
  });

  Transaction.fromJson(Map<String, dynamic> json)
      : accountNumber = json['accountNumber'],
        value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() =>
      'Transaction(accountNumber: $accountNumber, value: $value, contact: $contact)';
}
