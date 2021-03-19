import 'package:flutter/cupertino.dart';
import 'package:unirespadmapp/data/repositories/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:unirespadmapp/routes/app_routes.dart';
import 'package:unirespadmapp/views/components/dialog_box/index.dart';

class LoginController {
  final _repository = LoginRepository();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void entrar(BuildContext context) async {
    var dialog = new DialogBox();

    if (emailController.text.trim().length == 0) {
      dialog.showWarning(context,
          titulo: 'ATENÇÃO!', texto: 'E-mail não informado!');
    }

    if (senhaController.text.trim().length < 5) {
      dialog.showWarning(context, titulo: 'ATENÇÃO!', texto: 'Senha inválida');
    }

    var login = await _repository.efetuarLoginADM(
        emailController.text, senhaController.text);

    if (login == null)
      dialog.showWarning(context, titulo: 'ATENÇÃO!', texto: 'Login inválido!');
    else
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
  }
}
