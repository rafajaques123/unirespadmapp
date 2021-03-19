import 'package:cloud_firestore/cloud_firestore.dart';

class ColaboradorProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Incluir
  Future<void> incluir(Map map) async {
    await _firestore.collection('colaboradores').add(map);
  }

  Future<void> excluir(String uid) async {
    await _firestore.collection('colaboradores').doc(uid).delete();
  }

  //Selecionar
  Future<List<Map>> selecionarTodos() async {
    var qs = await _firestore.collection('colaboradores').get();

    var lista = new List<Map>();

    for (int i = 0; i < qs.docs.length; i++) {
      var colaborador = qs.docs[i].data();
      colaborador['id'] = qs.docs[i].id;
      lista.add(colaborador);
    }

    return lista;
  }

  //Alterar
  Future<void> alterar(Map map) async {
    await _firestore.collection('colaboradores').doc(map['id']).update(map);
  }
}
