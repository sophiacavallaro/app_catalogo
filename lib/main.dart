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
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF9F5),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD8C4E8),
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
        'nome_produto': 'Galaxy S24',
        'categoria': 'Celular',
        'preco': 4599.90,
        'quantidade_estoque': 12,
        'disponível': true,
        'tags': ['Android', '5G'],
      }),
      Produto.fromJson({
        'nome_produto': 'Notebook IdeaPad',
        'categoria': 'Notebook',
        'preco': 2899.90,
        'quantidade_estoque': 8,
        'disponível': true,
        'tags': ['Intel', '8GB'],
      }),
      Produto.fromJson({
        'nome_produto': 'Fone Bluetooth',
        'categoria': 'Acessório',
        'preco': 249.90,
        'quantidade_estoque': 4,
        'disponível': true,
        'tags': ['Wireless', 'Audio'],
      }),
      Produto.fromJson({
        'nome_produto': 'Smartwatch Fit',
        'categoria': 'Relógio',
        'preco': 599.90,
        'quantidade_estoque': 15,
        'disponível': true,
        'tags': ['Fitness', 'Bluetooth'],
      }),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catálogo de Produtos',
          style: TextStyle(
            color: Color(0xFF6F6275),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFFE9E5),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];

          return Card(
            color: const Color(0xFFFFFFFF),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(
                produto.nomeProduto,
                style: const TextStyle(
                  color: Color(0xFF665B68),
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${produto.categoria}\nR\$ ${produto.preco.toStringAsFixed(2)}\nEstoque: ${produto.quantidadeEstoque}',
                style: const TextStyle(
                  color: Color(0xFF948A96),
                ),
              ),
              isThreeLine: true,
              trailing: Icon(
                produto.disponivel
                    ? Icons.check_circle
                    : Icons.cancel,
                color: produto.disponivel
                    ? const Color(0xFFA8D5BA)
                    : const Color(0xFFE7A6A6),
              ),
            ),
          );
        },
      ),
    );
  }
}