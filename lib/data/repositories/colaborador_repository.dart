import 'package:unirespadmapp/data/models/colaborador_model.dart';
import 'package:unirespadmapp/data/providers/colaborador_provider.dart';

class ColaboradorRepository {
  static final _provider = new ColaboradorProvider();

  Future<bool> incluir(ColaboradorModel colaborador) async {
    try {
      await _provider.incluir(colaborador.toMap());
      return false;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> alterar(ColaboradorModel colaborador) async {
    try {
      await _provider.alterar(colaborador.toMap());
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<bool> excluir(ColaboradorModel colaborador) async {
    try {
      await _provider.excluir(colaborador.id);
      return true;
    } catch (ex) {
      print(ex);
      return false;
    }
  }

  Future<List<ColaboradorModel>> selecionarTodos() async {
    try {
      var map = await _provider.selecionarTodos();
      var lista = new List<ColaboradorModel>();
      for (int i = 0; i < map.length; i++) {
        lista.add(ColaboradorModel.fromMap(map[i]));
      }
      return lista;
    } catch (ex) {
      print(ex);
      return null;
    }
  }
}
