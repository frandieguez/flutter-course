import 'package:fitness_time/models/activity.dart';
import 'package:flutter/widgets.dart';

class Activities extends ChangeNotifier {
  List<Activity> activities = [
    Activity(
      id: 1,
      type: ActivityType.running,
      date: DateTime.now(),
      distance: 5.5,
    ),
    Activity(
      id: 2,
      type: ActivityType.walking,
      date: DateTime.now(),
      distance: 4.0,
    ),
    Activity(
      id: 3,
      type: ActivityType.biking,
      date: DateTime.now(),
      distance: 10.35,
    )
  ];

  Activity getActivityFromId(int id) {
    return activities.firstWhere((el) => el.id == id);
  }

  void removeActivity(int id) {
    activities.removeWhere((el) => el.id == id);

    notifyListeners();
  }

  void addActivity(Activity newActivity) {
    activities.add(newActivity);
    notifyListeners();
  }
}
