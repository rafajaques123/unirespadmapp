import 'package:flutter/material.dart';
import 'package:unirespadmapp/views/components/flat_button_ext/index.dart';
import 'package:unirespadmapp/email.dart';

// ignore: must_be_immutable
class CardSolicitacaoDetalhada extends StatelessWidget {
  String nome;
  String titulo;
  String ramo;
  String descricao;
  String email;
  CardSolicitacaoDetalhada(
      {this.nome, this.titulo, this.ramo, this.descricao, this.email});
  String _text = 'UNIRESP';
  var login = Email('unirespprojeto@gmail.com', 'uniresp123');

  void _sendEmail() async {
    bool result = await login.sendMessage(
        'Se você está lendo isso é porque a vagabunda do Rafael teve um progresso no TCC a igreja subiu, printe se tiver funcionado e anuncia no grupo',
        'lorraynimayssa@gmail.com',
        'BOOM CLAP');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              elevation: 2,
              child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  children: <Widget>[
                    Text(titulo,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Divider(),
                    Text('Descrição: ' + descricao,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text('Área: ' + ramo,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Divider(),
                    Text('Pergunta de: ' + nome,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text(' Email: ' + email,
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    FlatButtonExt(
                      text: 'ENCAMINHAR',
                      onPressed: _sendEmail,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
