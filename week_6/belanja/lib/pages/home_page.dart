import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(
      name: 'Apel',
      price: 5000,
      photo: 'image/apel.png',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Pisang',
      price: 3000,
      photo: 'image/pisang.png',
      stock: 20,
      rating: 4.0,
    ),
    Item(
      name: 'Jeruk',
      price: 4000,
      photo: 'image/jeyuk.png',
      stock: 8,
      rating: 4.2,
    ),
    Item(
      name: 'Mangga',
      price: 7000,
      photo: 'image/mangga.png',
      stock: 5,
      rating: 4.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belanja')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ProductCard(
                  item: item,
                  onTap: () =>
                      Navigator.pushNamed(context, '/item', arguments: item),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              'Satrio Ahmad Ramadhani • 2341720163',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }
}
