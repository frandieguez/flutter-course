import 'package:flutter/widgets.dart';

import '../models/user.dart';

class Profile extends ChangeNotifier {
  User user = User(
      name: "Xaina Carballo",
      avatar: "https://randomuser.me/api/portraits/women/44.jpg",
      height: 150.0,
      weight: 55.0,
      time: "2h 45'",
      distanceWalked: 212.4,
      activitiesCount: 42,
      registeredAt: DateTime.now().subtract(
          const Duration(days: 600, hours: 3, minutes: 43, seconds: 56)),
      profileCompleted: 70.0);
}
