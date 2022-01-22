import 'dart:convert';

class CityModel {
  CityModel({
    required this.nome,
  });

  final String nome;

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      nome: map['nome'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityModel && other.nome == nome;
  }

  @override
  int get hashCode => nome.hashCode;
}
