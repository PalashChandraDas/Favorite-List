import 'package:flutter/material.dart';

import 'model/fruit_model.dart';

class FruitDetailsPage extends StatelessWidget {
  final FruitModel fruit;

  const FruitDetailsPage({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fruit Details")),
      body: Center(
        child: Text(
          "Fruit: ${fruit.name}",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
