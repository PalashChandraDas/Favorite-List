import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'detail_page.dart';
import 'favorite_page.dart';
import 'model/fruit_model.dart';

class FruitListPage extends StatefulWidget {
  const FruitListPage({super.key});

  @override
  State<FruitListPage> createState() => _FruitListPageState();
}

class _FruitListPageState extends State<FruitListPage> {
  late Box<FruitModel> fruitBox;

  @override
  void initState() {
    super.initState();
    fruitBox = Hive.box<FruitModel>('fruits');
  }

  void toggleFavorite(FruitModel fruit) {
    setState(() {
      fruit.isFavorite = !fruit.isFavorite;
      fruitBox.put(fruit.id, fruit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruits List")),
      body: ValueListenableBuilder(
        valueListenable: fruitBox.listenable(),
        builder: (context, Box<FruitModel> box, _) {
          final fruits = box.values.toList();
          return ListView.builder(
            itemCount: fruits.length,
            itemBuilder: (context, index) {
              final fruit = fruits[index];
              return ListTile(
                title: Text(fruit.name),
                trailing: IconButton(
                  icon: Icon(
                    fruit.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: fruit.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () => toggleFavorite(fruit),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FruitDetailsPage(fruit: fruit),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => FavoritesPage()),
        ),
      ),
    );
  }
}



