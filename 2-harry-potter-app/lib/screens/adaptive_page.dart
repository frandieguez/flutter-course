import 'package:flutter/material.dart';
import 'package:harrypotter/screens/table_layout.dart';

import 'character_list.dart';

class AdaptivePage extends StatelessWidget {
  const AdaptivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return const CharacterList();
      } else {
        return const TabletLayout();
      }
    });
  }
}
