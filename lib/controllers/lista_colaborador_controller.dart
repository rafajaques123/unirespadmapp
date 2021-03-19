import 'package:flutter/cupertino.dart';
import 'package:unirespadmapp/data/models/colaborador_model.dart';
import 'package:unirespadmapp/data/providers/fire_base_auth_provider.dart';
import 'package:unirespadmapp/data/repositories/colaborador_repository.dart';
import 'package:unirespadmapp/routes/app_routes.dart';
import 'package:unirespadmapp/views/components/dialog_box/index.dart';

var dialog = new DialogBox();

class ListaColaboradorController {
  final _colaboradorRepository = new ColaboradorRepository();
  List<ColaboradorModel> colaboradores = new List<ColaboradorModel>();

  void sair(BuildContext context) {
    final auth = new FireBaseAuthProvider();
    auth.efetuarLogoff();
    Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
  }

  void criarNovoItem(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoutes.CRIAR_COLABORADOR);
  }

  Future<void> atualizarColaboradores() async {
    colaboradores.clear();
    colaboradores = await _colaboradorRepository.selecionarTodos();
  }

  void excluirColaborador(
    String uid,
    BuildContext context,
  ) {
    dialog.showConfirm(context,
        titulo: 'Tem certeza?',
        texto: 'Essa ação é permanente.', simOnClick: () async {
      await _colaboradorRepository.excluir(new ColaboradorModel(id: uid));
    }, naoOnClick: () {});
  }
}
