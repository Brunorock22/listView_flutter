import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItemTransferencia extends StatefulWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  _ItemTransferenciaState createState() => _ItemTransferenciaState();
}

class _ItemTransferenciaState extends State<ItemTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(widget._transferencia.valor.toString()),
      subtitle: Text(widget._transferencia.numeroConta.toString()),
    ));
  }
}
