import 'package:flutter/widgets.dart';

import '../models/activity.dart';
import '../services/database.dart';

class Activities extends ChangeNotifier {
  List<Activity> activities = [];
  List<Activity> activitiesInitial = [
    Activity(
      type: ActivityType.run,
      date: DateTime.now(),
      distance: 5.5,
    ),
    Activity(
      type: ActivityType.walk,
      date: DateTime.now(),
      distance: 4.0,
    ),
    Activity(
      type: ActivityType.biking,
      date: DateTime.now(),
      distance: 10.35,
    )
  ];

  Activities() {
    init();
  }

  init() async {
    activities = await Database.instance.getAllActivites();

    // Populate database
    if (activities.isEmpty) {
      for (var character in activitiesInitial) {
        await Database.instance.updateOrInsertActivity(character);
      }

      activities.addAll(activitiesInitial);
    }
    notifyListeners();
  }

  Activity getActivityFromId(int id) {
    return activities.firstWhere((el) => el.id == id);
  }

  void removeActivity(int id) {
    activities.removeWhere((el) => el.id == id);
    Database.instance.removeActivity(id);

    notifyListeners();
  }

  void addActivity(Activity newActivity) {
    activities.add(newActivity);
    Database.instance.updateOrInsertActivity(newActivity);

    notifyListeners();
  }
}
