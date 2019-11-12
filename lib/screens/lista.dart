import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar ="Transferências";

class ListaTranferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
          itemCount: widget._tranferencia.length,
          itemBuilder: (context, indice) {
            final transferecia = widget._tranferencia[indice];
            return ItemTransferencia(transferecia);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> futere =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          futere.then((tranferenciaRecebida) {
            debugPrint('$tranferenciaRecebida');
            Future.delayed(Duration(seconds: 1), () {
              if (tranferenciaRecebida != null) {
                setState(() {
                  widget._tranferencia.add(tranferenciaRecebida);
                });
              }
            });
          });
        },
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _tranferencia = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListaTranferenciasState();
  }
}
