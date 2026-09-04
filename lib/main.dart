import 'package:flutter/material.dart';
import 'models/produto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catálogo Mobile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF9F7),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 2,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      home: const ProdutoPage(),
    );
  }
}

class ProdutoPage extends StatelessWidget {
  const ProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final produtos = [
      Produto.fromJson({
        'nome_produto': 'Smartphone Galaxy S24',
        'categoria': 'Mobile',
        'preco': 4599.90,
        'quantidade_estoque': 12,
        'disponivel': true,
        'tags': ['android', '5g', 'snapdragon'],
      }),
      Produto.fromJson({
        'nome_produto': 'Notebook IdeaPad',
        'categoria': 'Computadores',
        'preco': 2899.90,
        'quantidade_estoque': 8,
        'disponivel': true,
        'tags': ['intel', '8gb'],
      }),
      Produto.fromJson({
        'nome_produto': 'Fone Bluetooth',
        'categoria': 'Acessórios',
        'preco': 249.90,
        'quantidade_estoque': 4,
        'disponivel': true,
        'tags': ['wireless', 'audio'],
      }),
      Produto.fromJson({
        'nome_produto': 'Smartwatch Fit',
        'categoria': 'Wearables',
        'preco': 599.90,
        'quantidade_estoque': 15,
        'disponivel': true,
        'tags': ['fitness', 'bluetooth'],
      }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catálogo de Produtos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFE9E4),
        foregroundColor: const Color(0xFF665B68),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x14000000),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nomeProduto,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF665B68),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    produto.categoria,
                    style: const TextStyle(
                      color: Color(0xFF9A8F9C),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2EAF6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'R\$ ${produto.preco.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF806A91),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.inventory_2_outlined,
                        size: 19,
                        color: Color(0xFF9A8F9C),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Estoque: ${produto.quantidadeEstoque}',
                        style: const TextStyle(
                          color: Color(0xFF817781),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        produto.temEstoqueCritico
                            ? Icons.warning_amber_rounded
                            : Icons.check_circle_rounded,
                        size: 19,
                        color: produto.temEstoqueCritico
                            ? const Color(0xFFE2A0A0)
                            : const Color(0xFFA8D5BA),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        produto.temEstoqueCritico
                            ? 'Estoque baixo'
                            : 'Disponível',
                        style: TextStyle(
                          color: produto.temEstoqueCritico
                              ? const Color(0xFFD58F8F)
                              : const Color(0xFF7EAE91),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: produto.tags.map((tag) {
                      return Chip(
                        label: Text(
                          tag,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF806A91),
                          ),
                        ),
                        backgroundColor: const Color(0xFFF5EEF8),
                        side: BorderSide.none,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFDCCBE8),
        foregroundColor: const Color(0xFF665B68),
        elevation: 3,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}