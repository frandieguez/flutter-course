import 'package:flutter/material.dart';
import 'package:harrypotter/screens/character_detail.dart';
import 'package:harrypotter/styles/app_styles.dart';
import 'package:provider/provider.dart';

import '../data/hogwarts_data.dart';
import '../data/preferences.dart';
import '../gen/assets.gen.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key, this.showAppBar = true, this.onTapped});

  final bool showAppBar;
  final Function(int)? onTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (showAppBar) ? const HogwartsAppBar() : null,
        body: Consumer<HogwardsData>(builder: (
          context,
          data,
          child,
        ) {
          return ListView(
            children: [
              for (var character in data.characters)
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Consumer<Preferences>(
                    builder: (
                      context,
                      preferences,
                      child,
                    ) {
                      return ListTile(
                        leading: Hero(
                          tag: character.name,
                          child: Image.network(character.imageUrl),
                        ),
                        title: Text(character.name),
                        subtitle: preferences.showSubtitles
                            ? Text(
                                "${character.stars.toStringAsFixed(1)} "
                                "- ${character.reviews} reviews",
                              )
                            : null,
                        trailing: Icon(
                          (character.favorite)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: AppStyles.trueBlue,
                        ),
                        onTap: () {
                          if (onTapped == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CharacterDetail(
                                          id: character.id,
                                        )));
                          } else {
                            onTapped!(character.id);
                          }
                        },
                      );
                    },
                  ),
                )
            ],
          );
        }));
  }
}

class HogwartsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HogwartsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Assets.images.hogwarts.image(
        height: 24,
      ),
      title: const Text("Welcome to Hogwarts"),
      actions: [
        Consumer<Preferences>(builder: (context, preferences, child) {
          return Switch(
            value: preferences.showSubtitles,
            onChanged: (value) {
              preferences.setShowSubtitles(value);
            },
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
