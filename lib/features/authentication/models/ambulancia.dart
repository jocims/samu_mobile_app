class Ambulancia {
  final int id;
  final String nome;
  final String placa;
  final String tipo;

  Ambulancia({
    required this.id,
    required this.nome,
    required this.placa,
    required this.tipo,
  });

  factory Ambulancia.fromJson(Map<String, dynamic> json) {
    return Ambulancia(
      id: json['id'],
      nome: json['nome'],
      placa: json['placa'],
      tipo: json['tipo'],
    );
  }
}
