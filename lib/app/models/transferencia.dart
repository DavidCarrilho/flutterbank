class Transferencia {
  final int numeroConta;
  final double valor;

  Transferencia(
    this.numeroConta,
    this.valor,
  );


  @override
  String toString() => 'Transferencia(numeroConta: $numeroConta, valor: $valor)';
}
