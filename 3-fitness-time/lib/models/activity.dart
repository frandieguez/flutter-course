enum ActivityType { running, walking, biking }

class Activity {
  final ActivityType type;
  final DateTime date;
  final double distance;

  Activity({
    required this.type,
    required this.date,
    required this.distance,
  });
}
