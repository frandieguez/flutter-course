import 'package:flutter/material.dart';

import '../models/character.dart';

const primarycolor = Colors.deepPurple;

class CharacterDetail extends StatelessWidget {
  final Character character;

  CharacterDetail({super.key, required this.character}) {}

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Hero(
              tag: character.name,
              child: Image.network(character.imageUrl, width: imageWidth / 2)),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      for (int i = 1; i <= 5; i++)
                        (character.stars >= i)
                            ? const Icon(Icons.star)
                            : const Icon(Icons.star_border_outlined),
                    ],
                  ),
                  Text("${character.reviews} reviews",
                      style:
                          const TextStyle(fontSize: 20, color: Colors.black26))
                ]),
          ),
          Text(
            character.name,
            style: const TextStyle(
                color: primarycolor, letterSpacing: .5, fontSize: 50),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    const Icon(Icons.fitness_center, size: 50),
                    const Text("Strength"),
                    Text(character.strength.toString())
                  ]),
                  Column(children: [
                    const Icon(Icons.auto_fix_normal, size: 51),
                    const Text("Magic"),
                    Text(character.magic.toString())
                  ]),
                  Column(children: [
                    const Icon(Icons.speed, size: 50),
                    const Text("Speed"),
                    Text(character.speed.toString())
                  ])
                ]),
          )
        ]),
      ),
    );
  }
}
