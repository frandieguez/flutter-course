import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/activity.dart';
import '../screens/add_activity_screen.dart';
import 'activity_icon.dart';

class ActivityListItem extends StatelessWidget {
  final Activity activity;

  const ActivityListItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat.yMMMMEEEEd();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      // decoration: BoxDecoration(
      //   color: Colors.pink.shade50,
      //   borderRadius: BorderRadius.circular(12.0),
      //   border: Border.all(
      //       color: Colors.transparent), // You can customize the border color
      // ),
      child: ListTile(
        leading: Hero(
          tag: activity.type,
          child: ActivityIcon(activity: activity, size: 40),
        ),
        title: activityTypeWidgets[activity.type],
        subtitle: Text(formatter.format(activity.date)),
        trailing: Text('${activity.distance} km'),
      ),
    );
  }
}
