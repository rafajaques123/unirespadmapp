import 'package:flutter/material.dart';
import 'package:unirespadmapp/views/components/card_solicitacao_detalhada/index.dart';

class SolicitacaoDetalhada extends StatefulWidget {
  @override
  _SolicitacaoDetalhadaState createState() => _SolicitacaoDetalhadaState();
}

class _SolicitacaoDetalhadaState extends State<SolicitacaoDetalhada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SOLICITAÇÃO DETALHADA'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Color(0xFF00CED1),
                Color(0xFF4682B4),
              ])),
        ),
      ),
      body: Center(
        child: CardSolicitacaoDetalhada(
            titulo: 'uau',
            descricao: 'descricao aqui',
            ramo: 'area aqui',
            nome: 'nome aqui',
            email: 'email aqui'),
      ),
    );
  }
}
