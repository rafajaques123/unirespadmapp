class ColaboradorModel {
  String id;
  String nome;
  String area;
  String email;

  ColaboradorModel({this.id, this.nome, this.area, this.email});

  ColaboradorModel.fromMap(Map map) {
    this.id = map['id'];
    this.nome = map['nome'];
    this.area = map['area'];
    this.email = map['email'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'id': this.id,
      'nome': this.nome,
      'area': this.area,
      'email': this.email,
    };

    return map;
  }
}
