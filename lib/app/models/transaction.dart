class Transaction {
  final int accountNumber;
  final double value;

  Transaction({this.accountNumber, this.value});


  @override
  String toString() => 'Transaction(accountNumber: $accountNumber, value: $value)';
}
