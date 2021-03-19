import 'package:unirespadmapp/data/models/solicitacao_model.dart';

import 'package:unirespadmapp/data/providers/solicitacoes_provider.dart';

class SolicitacoesRepository {
  static final _provider = new SolicitacoesProvider();

  Future<List<SolicitacaoModel>> selecionarTodos() async {
    try {
      var map = await _provider.selecionarTodos();
      var lista = new List<SolicitacaoModel>();
      for (int i = 0; i < map.length; i++) {
        lista.add(SolicitacaoModel.fromMap(map[i]));
      }
      return lista;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
