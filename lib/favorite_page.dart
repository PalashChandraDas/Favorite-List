import 'package:hive/hive.dart';

import 'detail_page.dart';
import 'model/fruit_model.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final fruitBox = Hive.box<FruitModel>('fruits');
    final favoriteFruits = fruitBox.values.where((fruit) => fruit.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Fruits")),
      body: ListView.builder(
        itemCount: favoriteFruits.length,
        itemBuilder: (context, index) {
          final fruit = favoriteFruits[index];
          return ListTile(
            title: Text(fruit.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FruitDetailsPage(fruit: fruit),
              ),
            ),
          );
        },
      ),
    );
  }
}
