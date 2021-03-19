import 'package:unirespadmapp/data/models/solicitacao_model.dart';
import 'package:unirespadmapp/data/repositories/solicitacoes_repository.dart';

class SolicitacoesController {
  final _solicitacoesRepository = new SolicitacoesRepository();
  List<SolicitacaoModel> solicitacoes = new List<SolicitacaoModel>();

  Future<void> atualizarSolicitacoes() async {
    solicitacoes.clear();
    solicitacoes = await _solicitacoesRepository.selecionarTodos();
  }
}
