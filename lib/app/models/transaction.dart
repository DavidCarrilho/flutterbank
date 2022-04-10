import 'models.dart';

class Transaction {
  final String id;
  final int accountNumber;
  final double value;
  final Contact contact;

  Transaction({
    this.id,
    this.accountNumber,
    this.contact,
    this.value,
  });

  Transaction.fromJson(Map<String, dynamic> json) :
      id = json['id'],
       accountNumber = json['accountNumber'],
        value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() =>
      'Transaction(accountNumber: $accountNumber, value: $value, contact: $contact)';
}
