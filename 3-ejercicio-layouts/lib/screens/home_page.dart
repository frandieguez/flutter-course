import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  final Key? key;

  const HomePage({this.key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _userAvatarUrl =
      "https://randomuser.me/api/portraits/women/44.jpg";
  final _userName = "Xaina Carballo";
  double _userHeight = 150.0;
  double _userWeight = 55.0;
  final String _userTime = "2h 45'";
  final double _userDistanceWalked = 212.4;
  final double _userActivitiesCount = 42;
  final _userRegisteredAt = DateFormat.yMMMd().format(DateTime.now()
      .subtract(const Duration(days: 600, hours: 3, minutes: 43, seconds: 56)));
  final _userProfileCompleted = 70.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Center(child: Text('Profile', textAlign: TextAlign.center)),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(_userAvatarUrl),
              ),
              Text(
                _userName,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              Text(
                "registered at $_userRegisteredAt",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.surface,
                    ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildColumnWithShadow(
                      children: [
                        const Icon(Icons.timer, size: 50),
                        const Text("Time"),
                        Text(_userTime, style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                    _buildColumnWithShadow(
                      children: [
                        const Icon(Icons.location_on, size: 51),
                        const Text("km"),
                        Text(_userDistanceWalked.toString(),
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                    _buildColumnWithShadow(
                      children: [
                        const Icon(Icons.speed, size: 50),
                        const Text("Activities"),
                        Text(_userActivitiesCount.toString(),
                            style: const TextStyle(fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildSliderRow(
                      name: 'Height',
                      value: _userHeight,
                      minValue: 80,
                      maxValue: 250,
                      onChanged: (value) {
                        setState(() {
                          _userHeight = value;
                        });
                      },
                    ),
                    _buildSliderRow(
                      name: 'Weight',
                      value: _userWeight,
                      minValue: 40,
                      maxValue: 150,
                      onChanged: (value) {
                        setState(() {
                          _userWeight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularPercentIndicator(
                  radius: MediaQuery.of(context).size.width / 5,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 15.0,
                  percent: _userProfileCompleted / 100,
                  center: Text(
                    "${_userProfileCompleted.toString()} %",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Theme.of(context).colorScheme.onTertiary,
                  progressColor: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliderRow(
      {required String name,
      required double value,
      required double minValue,
      required double maxValue,
      required ValueChanged<double> onChanged}) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 16.0),
        ),
        Expanded(
          child: Slider(
            value: value,
            min: minValue,
            max: maxValue,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 16.0),
        Text(
          value.toStringAsFixed(2),
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  Widget _buildColumnWithShadow({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
