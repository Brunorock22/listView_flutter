import 'package:bytebank/componentes/editor.dart';
import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTranferenciaState();
  }
}

class FormularioTranferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                  controlador: _controladorCampoNumeroConta,
                  dica: 'Número da conta',
                  rotulo: '0000'),
              Editor(
                  controlador: _controladorCampoValor,
                  dica: 'Valor',
                  rotulo: '222',
                  icone: Icons.monetization_on),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => _criaTranferencia(context),
              )
            ],
          ),
        ));
  }

  void _criaTranferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
