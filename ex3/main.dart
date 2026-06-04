import 'package:flutter/material.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'A fast, modern programming language.',
    imagePath: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'Build beautiful apps from a single codebase.',
    imagePath: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'Backend services for your mobile apps.',
    imagePath: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String imagePath;

  const Product({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product.imagePath, height: 50),
          SizedBox(height: 8),
          Text(
            product.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(product.description),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Ex 3 – Products')),
        // Scaffold → body → Padding
        body: Padding(
          padding: const EdgeInsets.all(16),
          // Padding → child → Column
          child: Column(
            children: [
              // Column → child → Card (one per product)
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}
