import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:harrypotter/data/preferences.dart';
import 'package:provider/provider.dart';

import '../gen/assets.gen.dart';

class HogwartsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HogwartsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return AppBar(
      leading: Assets.images.hogwarts.image(
        height: 24,
      ),
      title: Text(l.welcomeToHogwarts),
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
