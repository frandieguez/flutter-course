import 'package:fitness_time/models/activity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/activities.dart';
import '../data/profile.dart';
import '../widgets/activity_list_item.dart';

class ActivityListScreen extends StatefulWidget {
  @override
  _ActivityListScreenState createState() => _ActivityListScreenState();
}

class _ActivityListScreenState extends State<ActivityListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Activities, Profile>(
        builder: (context, activitiesProvider, profileProvider, child) {
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
                    backgroundImage: NetworkImage(profileProvider.user.avatar),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/profile/me',
                    );
                  },
                )),
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
                        backgroundImage:
                            NetworkImage(profileProvider.user.avatar),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/profile/me',
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      profileProvider.user.name,
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
          child: activitiesProvider.activities.isNotEmpty
              ? ListView.builder(
                  itemCount: activitiesProvider.activities.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Scaffold.of(context)
                            .showBottomSheet<void>((BuildContext context) {
                          return Container(
                            height: 150,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ElevatedButton(
                                      onPressed: () => {
                                            Navigator.pushNamed(
                                              context,
                                              '/details',
                                              arguments: {
                                                'id': activitiesProvider
                                                    .activities[index].id
                                              },
                                            )
                                          },
                                      child: Text("View")),
                                  ElevatedButton(
                                      onPressed: () {
                                        var activityId = activitiesProvider
                                            .activities[index].id;

                                        activitiesProvider
                                            .removeActivity(activityId);

                                        Navigator.pop(context);
                                      },
                                      child: Text("Remove")),
                                  ElevatedButton(
                                    child: const Text('Close BottomSheet'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                        // Navigator.pushNamed(
                        //   context,
                        //   '/details',
                        //   arguments: {
                        //     'id': activitiesProvider.activities[index].id
                        //   },
                        // );
                      },
                      child: Dismissible(
                          onDismissed: (direction) {
                            activitiesProvider.activities
                                .remove(activitiesProvider.activities[index]);
                          },
                          key: UniqueKey(),
                          child: ActivityListItem(
                              activity: activitiesProvider.activities[index])),
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
                activitiesProvider.activities.add(newActivity);
              });
            }
          },
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
