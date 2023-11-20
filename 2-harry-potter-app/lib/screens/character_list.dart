import 'package:flutter/material.dart';
import 'package:harrypotter/screens/character_detail.dart';

import '../models/character.dart';

List<Character> characters = [
  Character(
      name: 'Harry Potter',
      imageUrl:
          "https://media.revistavanityfair.es/photos/60e84a97a5768ac18af685dd/master/w_1280,c_limit/39710.jpg",
      totalStars: 0,
      reviews: 0,
      strength: 8,
      magic: 9,
      speed: 10),
  Character(
      name: 'Hermione Granger',
      imageUrl:
          "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1200?cb=20120729103114&path-prefix=es",
      totalStars: 5,
      reviews: 109,
      strength: 8,
      magic: 9,
      speed: 10),
  Character(
      name: 'Ron Weasley',
      imageUrl:
          'https://static.wikia.nocookie.net/the-truth-behind-aurora/images/8/85/Ron_Weasley.jpg/revision/latest?cb=20211008072329',
      totalStars: 4,
      reviews: 90,
      strength: 8,
      magic: 9,
      speed: 10),
];

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character list'),
        centerTitle: true,
      ),
      body: ListView(children: [
        for (var char in characters)
          Padding(
            padding: const EdgeInsets.all(2),
            child: ListTile(
              title: Text(char.name),
              leading: Hero(
                  tag: char.name,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(char.imageUrl,
                          height: 100, width: 100))),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CharacterDetail(character: char)));
              },
            ),
          )
      ]),
    );
  }
}
