import 'package:flutter/material.dart';
import 'package:harrypotter/data/howards_data.dart';
import 'package:harrypotter/data/preferences.dart';
import 'package:harrypotter/screens/character_detail.dart';
import 'package:provider/provider.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<HowardsData, Preferences>(
        builder: (context, charactersProvider, preferencesProvider, child) {
      return Scaffold(
          appBar: AppBar(
              title: const Text('Character list'),
              centerTitle: true,
              leading: Switch(
                  value: preferencesProvider.showSubtitles,
                  onChanged: (value) {
                    preferencesProvider.setShowSubtitles(value);
                  })),
          body: ListView(children: [
            for (var char in charactersProvider.characters)
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
                  subtitle: preferencesProvider.showSubtitles
                      ? Text(
                          "${char.stars.toStringAsFixed(1)} - ${char.reviews} reviews")
                      : null,
                  trailing: Icon(
                      char.favorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CharacterDetail(id: char.id)));
                  },
                ),
              )
          ]));
    });
  }
}
