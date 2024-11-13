import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'fruit_list_page.dart';
import 'model/fruit_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FruitModelAdapter());
  await Hive.openBox<FruitModel>('fruits');
  addSampleFruits(); // Adds initial sample data if the box is empty
  runApp(const MyApp());
}

void addSampleFruits() {
  final box = Hive.box<FruitModel>('fruits');
  if (box.isEmpty) {
    final fruits = [
      "Apple",
      "Banana",
      "Orange",
      "Mango",
      "Grapes",
      "Pineapple",
      "Watermelon",
      "Peach",
      "Strawberry",
      "Kiwi",
      "Papaya",
      "Cherry",
      "Avocado",
      "Blueberry",
      "Raspberry",
      "Pear",
      "Lychee",
      "Guava",
      "Pomegranate",
      "Dragon Fruit",
    ];
    for (int i = 0; i < fruits.length; i++) {
      box.add(FruitModel(id: i, name: fruits[i]));
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FruitListPage(),
    );
  }
}
