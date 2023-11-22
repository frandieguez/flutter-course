import 'package:flutter/widgets.dart';

import '../models/character.dart';

class HowardsData extends ChangeNotifier {
  List<Character> characters = [
    Character(
        id: 1,
        name: 'Harry Potter',
        imageUrl:
            "https://media.revistavanityfair.es/photos/60e84a97a5768ac18af685dd/master/w_1280,c_limit/39710.jpg",
        totalStars: 0,
        reviews: 0,
        strength: 8,
        magic: 9,
        speed: 10),
    Character(
        id: 2,
        name: 'Hermione Granger',
        imageUrl:
            "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1200?cb=20120729103114&path-prefix=es",
        totalStars: 5,
        reviews: 109,
        strength: 8,
        magic: 9,
        speed: 10),
    Character(
        id: 3,
        name: 'Ron Weasley',
        imageUrl:
            'https://static.wikia.nocookie.net/the-truth-behind-aurora/images/8/85/Ron_Weasley.jpg/revision/latest?cb=20211008072329',
        totalStars: 4,
        reviews: 90,
        strength: 8,
        magic: 9,
        speed: 10),
  ];

  void addReview(int id, double rating) {
    characters.firstWhere((el) => el.id == id).addReview(rating);

    notifyListeners();
  }

  Character getCharFromId(int id) => characters.firstWhere((el) => el.id == id);

  void toggleFavorite(int id) {
    getCharFromId(id).toggleFavorite();

    notifyListeners();
  }
}
