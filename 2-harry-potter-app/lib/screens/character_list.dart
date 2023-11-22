import 'package:flutter/material.dart';
import 'package:harrypotter/data/howards_data.dart';
import 'package:harrypotter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Character list'),
          centerTitle: true,
        ),
        body: Consumer<HowardsData>(builder: (context, data, child) {
          return ListView(children: [
            for (var char in data.characters)
              Padding(
                padding: const EdgeInsets.all(2),
                child: ListTile(
                  title: Text(char.name),
                  leading: Hero(
                    tag: char.name,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(char.imageUrl,
                            height: 100, width: 100)),
                  ),
                  subtitle: Text(
                      "${char.stars.toStringAsFixed(1)} - ${char.reviews} reviews"),
                  trailing: Icon(char.favorite
                      ? Icons.heart_broken
                      : Icons.heart_broken_outlined),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CharacterDetail(id: char.id)));
                  },
                ),
              )
          ]);
        }));
  }
}
