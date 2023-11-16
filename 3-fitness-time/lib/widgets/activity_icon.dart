import 'package:fitness_time/models/activity.dart';
import 'package:flutter/material.dart';

class ActivityIcon extends StatelessWidget {
  final Activity activity;
  final double size;

  ActivityIcon({super.key, required this.activity, required this.size});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.battery_unknown;

    switch (activity.type) {
      case ActivityType.running:
        icon = Icons.directions_run;
      case ActivityType.walking:
        icon = Icons.directions_walk;
      case ActivityType.biking:
        icon = Icons.directions_bike;
    }
    return Icon(icon, size: size);
  }
}
