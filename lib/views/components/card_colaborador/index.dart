import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:unirespadmapp/data/models/colaborador_model.dart';
// ignore: unused_import
import 'package:unirespadmapp/views/pages/colaboradores/index.dart';

// ignore: must_be_immutable
class CardColaborador extends StatelessWidget {
  String nome;
  String area;
  String email;
  String uid;
  Function(String uid) onDelete;
  Function onRefresh;
  CardColaborador(
      {this.nome,
      this.area,
      this.email,
      this.uid,
      this.onDelete,
      this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: InkWell(
        child: Dismissible(
          key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment(0.9, 0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onDelete(this.uid);
          },
          child: Card(
            elevation: 2,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.nome,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Área de conhecimento: ' + this.area,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'E-mail: ' + this.email,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
