import 'package:flutter/material.dart';
import 'package:unirespadmapp/controllers/lista_colaborador_controller.dart';
import 'package:unirespadmapp/routes/app_routes.dart';
import 'package:unirespadmapp/views/components/card_colaborador/index.dart';

class ListaColaboradores extends StatefulWidget {
  @override
  _ListaColaboradoresState createState() => _ListaColaboradoresState();
}

class _ListaColaboradoresState extends State<ListaColaboradores> {
  final _controller = new ListaColaboradorController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() {
    _controller.atualizarColaboradores().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('COLABORADORES'),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF00CED1),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.CRIAR_COLABORADOR);
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          carregarDados();
        },
        child: ListView.builder(
            itemCount: _controller.colaboradores.length,
            itemBuilder: (context, index) {
              print('Executou');
              return CardColaborador(
                nome: _controller.colaboradores[index].nome,
                area: _controller.colaboradores[index].area,
                email: _controller.colaboradores[index].email,
                uid: _controller.colaboradores[index].id,
                onDelete: (uid) {
                  _controller.excluirColaborador(uid, context);
                },
                onRefresh: () {
                  carregarDados();
                },
              );
            }),
      ),
    );
  }
}
