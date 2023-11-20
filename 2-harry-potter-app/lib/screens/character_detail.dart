import 'package:flutter/material.dart';

import '../models/character.dart';
import '../widgets/rating.dart';

const primarycolor = Colors.deepPurple;

class CharacterDetail extends StatefulWidget {
  final Character character;

  CharacterDetail({super.key, required this.character}) {}

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  double lastValueClicked = 0;

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.character.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                  tag: widget.character.name,
                  child: Image.network(widget.character.imageUrl,
                      width: imageWidth / 2)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Rating(value: widget.character.stars),
                      Text("${widget.character.reviews} reviews",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black26))
                    ]),
              ),
              Text(
                widget.character.name,
                style: const TextStyle(
                    color: primarycolor, letterSpacing: .5, fontSize: 50),
              ),
              Rating(
                  value: lastValueClicked,
                  color: Colors.blue,
                  onRating: (value) {
                    lastValueClicked = value;
                    setState(() {
                      widget.character.addReview(value);
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        const Icon(Icons.fitness_center, size: 50),
                        const Text("Strength"),
                        Text(widget.character.strength.toString())
                      ]),
                      Column(children: [
                        const Icon(Icons.auto_fix_normal, size: 51),
                        const Text("Magic"),
                        Text(widget.character.magic.toString())
                      ]),
                      Column(children: [
                        const Icon(Icons.speed, size: 50),
                        const Text("Speed"),
                        Text(widget.character.speed.toString())
                      ])
                    ]),
              )
            ]),
      ),
    );
  }
}
