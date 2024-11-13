import 'package:hive/hive.dart';

part 'fruit_model.g.dart';

@HiveType(typeId: 0)
class FruitModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  bool isFavorite;

  FruitModel({required this.id, required this.name, this.isFavorite = false});
}
