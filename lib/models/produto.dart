class Produto {
  final String nomeProduto;
  final String categoria;
  final double preco;
  final int quantidadeEstoque;
  final bool disponivel;
  final List<String> tags;

  Produto({
    required this.nomeProduto,
    required this.categoria,
    required this.preco,
    required this.quantidadeEstoque,
    required this.disponivel,
    required this.tags,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nomeProduto: json['nome_produto'],
      categoria: json['categoria'],
      preco: json['preco'].toDouble(),
      quantidadeEstoque: json['quantidade_estoque'],
      disponivel: json['disponível'],
      tags: List<String>.from(json['tags']),
    );
  }

  bool get temEstoqueCritico {
    return quantidadeEstoque <= 5;
  }
}