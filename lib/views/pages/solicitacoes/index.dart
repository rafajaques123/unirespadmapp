import 'package:flutter/material.dart';
import 'package:unirespadmapp/views/components/solicitacao_card/index.dart';
import 'package:unirespadmapp/controllers/solicitacoes_controller.dart';

class SolicitacoesPage extends StatefulWidget {
  @override
  _SolicitacoesPageState createState() => _SolicitacoesPageState();
}

class _SolicitacoesPageState extends State<SolicitacoesPage> {
  final _controller = new SolicitacoesController();
  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    _controller.atualizarSolicitacoes().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SOLICITAÇÕES'),
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
      body: RefreshIndicator(
        onRefresh: () async {
          carregarDados();
        },
        child: ListView.builder(
            itemCount: _controller.solicitacoes.length,
            itemBuilder: (context, index) {
              print('Executou');
              return CardSolicitacao(
                titulo: _controller.solicitacoes[index].titulo,
                nome: _controller.solicitacoes[index].nome,
                ramo: _controller.solicitacoes[index].ramo,
                uid: _controller.solicitacoes[index].id,
                onRefresh: () {
                  carregarDados();
                },
              );
            }),
      ),
    );
  }
}
