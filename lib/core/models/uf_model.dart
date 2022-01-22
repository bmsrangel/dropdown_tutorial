import 'dart:convert';

class UfModel {
  UfModel({
    required this.sigla,
    required this.nome,
  });

  final String sigla;
  final String nome;

  Map<String, dynamic> toMap() {
    return {
      'sigla': sigla,
      'nome': nome,
    };
  }

  factory UfModel.fromMap(Map<String, dynamic> map) {
    return UfModel(
      sigla: map['sigla'] ?? '',
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UfModel.fromJson(String source) =>
      UfModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UfModel && other.sigla == sigla && other.nome == nome;
  }

  @override
  int get hashCode => sigla.hashCode ^ nome.hashCode;
}
