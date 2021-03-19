class SolicitacaoDetalhadaModel {
  String id;
  String titulo;
  String descricao;
  String ramo;
  String email;
  String nome;
  SolicitacaoDetalhadaModel(
      {this.id, this.titulo, this.descricao, this.ramo, this.email, this.nome});
  SolicitacaoDetalhadaModel.fromMap(Map map) {
    this.id = map['id'];
    this.titulo = map['titulo'];
    this.descricao = map['descricao'];
    this.ramo = map['ramo'];
    this.email = map['email'];
    this.nome = map['nome'];
  }
  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'titulo': this.titulo,
      'descricao': this.descricao,
      'ramo': this.ramo,
      'email': this.email,
      'nome': this.nome,
    };
    return map;
  }
}
