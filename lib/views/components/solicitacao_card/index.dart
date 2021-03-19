import 'package:flutter/material.dart';

import 'package:unirespadmapp/routes/app_routes.dart';

// ignore: must_be_immutable
class CardSolicitacao extends StatelessWidget {
  String nome;
  String titulo;
  String ramo;
  String uid;
  Function onRefresh;

  CardSolicitacao({
    this.nome,
    this.titulo,
    this.ramo,
    this.uid,
    this.onRefresh,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(1.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '   ' + this.titulo,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '      Pergunta de: ' + this.nome,
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      '      Área: ' + this.ramo,
                      style: TextStyle(fontSize: 17),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('DETALHES'),
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                                AppRoutes.SOLICITACAODETALHADA);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
