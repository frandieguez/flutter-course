import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/activity.dart';
import '../widgets/activity_icon.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Activity activity;
  final DateFormat formatter = DateFormat.yMMMMEEEEd();

  ActivityDetailsScreen({required this.activity}) {}

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Hero(
              tag: activity.type,
              child: ActivityIcon(activity: activity, size: 200)),
          Text(
            "${activity.distance} km",
            style: const TextStyle(letterSpacing: .5, fontSize: 50),
          ),
          Text(
            "${formatter.format(activity.date)}",
            textAlign: TextAlign.center,
            style: const TextStyle(letterSpacing: .5, fontSize: 30),
          ),
        ]),
      ),
    );
  }
}
