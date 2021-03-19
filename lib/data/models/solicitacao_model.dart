class SolicitacaoModel {
  String id;
  String titulo;
  String ramo;
  String nome;

  SolicitacaoModel({this.id, this.titulo, this.ramo, this.nome});

  SolicitacaoModel.fromMap(Map map) {
    this.id = map['id'];
    this.titulo = map['titulo'];
    this.ramo = map['ramo'];
    this.nome = map['nome'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'titulo': this.titulo,
      'ramo': this.ramo,
      'nome': this.nome,
    };
    return map;
  }
}
