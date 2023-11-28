import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'activity.g.dart';

enum ActivityType {
  walk("Caminar", Icons.directions_walk),
  run("Correr", Icons.directions_run),
  biking("Bicicleta", Icons.directions_bike);

  final String description;
  final IconData icon;

  const ActivityType(this.description,  this.icon);
}

@collection
class Activity {
  final Id id = Isar.autoIncrement;
  @enumerated
  final ActivityType type;
  final DateTime date;
  final double distance;

  Activity({
    required this.type,
    required this.date,
    required this.distance,
  });
}
