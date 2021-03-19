import 'package:flutter/cupertino.dart';
import 'package:unirespadmapp/data/models/colaborador_model.dart';
import 'package:unirespadmapp/data/repositories/colaborador_repository.dart';
import 'package:unirespadmapp/routes/app_routes.dart';
import 'package:unirespadmapp/views/components/dialog_box/index.dart';

class ColaboradorController {
  final _repository = new ColaboradorRepository();

  final uidController = new TextEditingController();
  final nomeController = new TextEditingController();
  final areaController = new TextEditingController();
  final emailController = new TextEditingController();

  void salvar(BuildContext context) async {
    var dialogo = new DialogBox();
    if (nomeController.text.trim().length == 0) {
      dialogo.showWarning(context,
          titulo: 'ATENÇÃO', texto: 'Nome não informado');
      return;
    }

    if (areaController.text.trim().length == 0) {
      dialogo.showWarning(context,
          titulo: 'ATENÇÃO', texto: 'Área não informada');
      return;
    }

    if (emailController.text.trim().length == 0) {
      dialogo.showWarning(context,
          titulo: 'ATENÇÃO', texto: 'Email não informado');
      return;
    }

    var colaborador = new ColaboradorModel(
        id: uidController.text,
        nome: nomeController.text,
        area: areaController.text,
        email: emailController.text);

    //CloudFireStoreprovider
    if ((colaborador.id == null) || (colaborador.id.trim().length == 0))
      await _repository.incluir(colaborador);
    else
      await _repository.alterar(colaborador);

    Navigator.of(context).pushNamed(AppRoutes.COLABORADORES);
  }
}
