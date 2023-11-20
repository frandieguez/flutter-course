import 'package:fitness_time/models/activity.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/activity_list_item.dart';

class ActivityListScreen extends StatefulWidget {
  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  List<Activity> activities = [
    Activity(
      type: ActivityType.running,
      date: DateTime.now(),
      distance: 5.5,
    ),
    Activity(
      type: ActivityType.walking,
      date: DateTime.now(),
      distance: 4.0,
    ),
    Activity(
      type: ActivityType.biking,
      date: DateTime.now(),
      distance: 10.35,
    )
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity List'),
        centerTitle: true,
        actions: <Widget>[
          Hero(
              tag: 'user_avatar',
              child: IconButton(
                    icon: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/profile/me',
                        arguments: {
                          'profile': user,
                        },
                      );
                    },
                  )
              ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/profile/me',
                        arguments: {
                          'profile': user,
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings page
                Navigator.pop(context); // Close the drawer
                // Add your navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // Implement logout logic
                Navigator.pop(context); // Close the drawer
                // Add your logout logic here
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: activities.isNotEmpty
            ? ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: {'activity': activities[index]},
                      );
                    },
                    child: Dismissible(
                        onDismissed: (direction) {
                          activities.remove(activities[index]);
                        },
                        key: UniqueKey(),
                        child: ActivityListItem(activity: activities[index])),
                  );
                },
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.directions_run,
                        size: 200,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  Text(
                    "No hay actividades. Pulsa + \npara añadir una.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newActivity = await Navigator.pushNamed(context, '/add');

          if (newActivity != null && newActivity is Activity) {
            setState(() {
              activities.add(newActivity);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
