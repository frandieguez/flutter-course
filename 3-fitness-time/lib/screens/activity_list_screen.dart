import 'package:fitness_time/models/activity.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity List'),
        centerTitle: true,
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
