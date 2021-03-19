import 'package:cloud_firestore/cloud_firestore.dart';

class SolicitacoesProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Selecionar
  Future<List<Map>> selecionarTodos() async {
    var qs = await _firestore.collection('solicitacoes').get();
    var lista = new List<Map>();

    for (int i = 0; i < qs.docs.length; i++) {
      var solicitacoes = qs.docs[i].data();
      solicitacoes['id'] = qs.docs[i].id;
      lista.add(solicitacoes);
    }

    return lista;
  }
}
