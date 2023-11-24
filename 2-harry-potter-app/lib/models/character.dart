import 'package:isar/isar.dart';

part 'character.g.dart';

// Created following the guide at https://isar.dev/tutorials/quickstart.html#_1-add-dependencies

@collection
class Character {
  Id id = Isar.autoIncrement;
  final String name;
  final String imageUrl;
  double totalStars = 0;
  int reviews;
  final int strength;
  final int magic;
  final int speed;

  double get stars => reviews == 0 ? 0 : totalStars / reviews;
  bool favorite = false;

  Character(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.totalStars,
      required this.reviews,
      required this.strength,
      required this.magic,
      required this.speed});

  addReview(double review) {
    reviews++;
    totalStars += review;
  }

  toggleFavorite() {
    favorite = !favorite;
  }
}
