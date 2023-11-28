import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/activities.dart';

class ActivityDetailsScreen extends StatefulWidget {
  final int id;

  ActivityDetailsScreen({super.key, required this.id});

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  @override
  final DateFormat formatter = DateFormat.yMMMMEEEEd();

  @override
  Widget build(BuildContext context) {
    return Consumer<Activities>(builder: (context, data, child) {
      var activity = data.getActivityFromId(widget.id);

      return Scaffold(
        appBar: AppBar(
          title: const Text('Activity Details'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Hero(
                      tag: activity.type,
                      child: Icon(activity.type.icon, size: 200),
                    ),
                  ),
                  Text(
                    '${activity.distance.toStringAsFixed(2)} km',
                    style: const TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    formatter.format(activity.date),
                    style: const TextStyle(
                      letterSpacing: 1.0,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
