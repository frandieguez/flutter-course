import 'package:flutter/material.dart';
import 'package:harrypotter/data/howards_data.dart';
import 'package:provider/provider.dart';

import '../widgets/rating.dart';

const primarycolor = Colors.deepPurple;

class CharacterDetail extends StatefulWidget {
  final int id;

  CharacterDetail({super.key, required this.id}) {}

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  double lastValueClicked = 0;

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width;
    return Consumer<HowardsData>(builder: (context, data, child) {
      var character = data.getCharFromId(widget.id);

      return Scaffold(
        appBar: AppBar(
          title: Text(character.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                    tag: character.name,
                    child: Image.network(character.imageUrl,
                        width: imageWidth / 2)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Rating(value: character.stars),
                        Text("${character.reviews} reviews",
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black26))
                      ]),
                ),
                Text(
                  character.name,
                  style: const TextStyle(
                      color: primarycolor, letterSpacing: .5, fontSize: 50),
                ),
                Row(
                  children: [
                    Rating(
                        value: lastValueClicked,
                        color: Colors.blue,
                        onRating: (value) {
                          lastValueClicked = value;
                          data.addReview(widget.id, value);
                        }),
                    InkWell(
                        child: Icon(character.favorite
                            ? Icons.heart_broken
                            : Icons.heart_broken_outlined),
                        onTap: () => data.toggleFavorite(widget.id))
                  ],
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
    });
  }
}
