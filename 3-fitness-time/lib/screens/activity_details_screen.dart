import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/activity.dart';
import '../widgets/activity_icon.dart';

class ActivityDetailsScreen extends StatelessWidget {
  @override
  final Activity activity;
  final DateFormat formatter = DateFormat.yMMMMEEEEd();

  ActivityDetailsScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    var imageWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Hero(
                  tag: activity.type,
                  child: ActivityIcon(activity: activity, size: 200),
                ),
              ),
              Text(
                '${activity.distance.toStringAsFixed(2)} km',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Text(
                formatter.format(activity.date),
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ]),
      ),
    );
  }
}
