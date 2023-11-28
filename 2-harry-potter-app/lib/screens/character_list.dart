import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harrypotter/screens/character_detail.dart';
import 'package:harrypotter/styles/app_styles.dart';
import 'package:provider/provider.dart';

import '../data/hogwarts_data.dart';
import '../data/preferences.dart';
import '../widgets/hogwarts_app_bar.dart';

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
                                "${character.stars.toStringAsFixed(1)} ${AppLocalizations.of(context)!.reviewsCount(character.reviews)}")
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
                ),
              // CalendarDatePicker(
              //   initialDate: DateTime.now(),
              //   firstDate: DateTime(1900),
              //   lastDate: DateTime(2100),
              //   onDateChanged: (value) {},
              // )
            ],
          );
        }));
  }
}
