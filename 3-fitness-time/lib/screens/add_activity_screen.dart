import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/activity.dart';

class AddActivityScreen extends StatefulWidget {
  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

Map<ActivityType, Widget> activityTypeWidgets = {
  ActivityType.biking: const Text('Biking'),
  ActivityType.running: const Text('Running'),
  ActivityType.walking: const Text('Walking'),
};

class _AddActivityScreenState extends State<AddActivityScreen> {
  late ActivityType _type = ActivityType.running;
  late double _distance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Activity'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ToggleButtons(
              isSelected:
                  activityTypeWidgets.keys.map((e) => e == _type).toList(),
              onPressed: (index) {
                setState(() {
                  _type = activityTypeWidgets.keys.elementAt(index);
                });
              },
              children: [
                for (var entry in activityTypeWidgets.entries) entry.value,
              ],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              // selectedBorderColor: Colors.red[700],
              // selectedColor: Colors.white,
              // fillColor: Colors.red[200],
              // color: Colors.red[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
            ),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Type'),
            //   onChanged: (value) {
            //     setState(() {
            //       _type = value;
            //     });
            //   },
            // ),
            SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Distance'),
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), // Allow decimal input
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))
              ], // Allow only numbers and one dot

              onChanged: (value) {
                setState(() {
                  _distance = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform activity addition logic here
                Activity newActivity = Activity(
                  id: DateTime.now().millisecondsSinceEpoch,
                  type: _type,
                  date: DateTime.now(),
                  distance: _distance,
                );
                Navigator.pop(context, newActivity);
              },
              child: const Text('Añadir actividad'),
            ),
          ],
        ),
      ),
    );
  }
}
