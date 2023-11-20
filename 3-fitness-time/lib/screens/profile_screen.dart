import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../models/user.dart';
import '../widgets/data_card.dart';

class ProfileScreen extends StatefulWidget {
  @override
  final Key? key;
  final User profile;

  const ProfileScreen({this.key, required this.profile}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Center(child: Text('Profile', textAlign: TextAlign.center)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Animate(
                  effects: [],
                  onPlay: (controller) => controller.repeat(),
                  child: Hero(
                    tag: 'user_avatar',
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(widget.profile.avatar),
                    ),
                  )),
              Text(
                widget.profile.name,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Colors.black45,
                    ),
              ),
              Text(
                "registered at ${DateFormat.yMMMd().format(widget.profile.registeredAt)}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black38,
                    ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DataCard(
                        icon: Icons.timer,
                        text: "Time",
                        value: widget.profile.time.toString()),
                    DataCard(
                        icon: Icons.location_on,
                        text: "km",
                        value: widget.profile.distanceWalked.toString()),
                    DataCard(
                        icon: Icons.location_on,
                        text: "Activities",
                        value: widget.profile.activitiesCount.toString()),
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
                      value: widget.profile.height,
                      minValue: 80,
                      maxValue: 250,
                      onChanged: (value) {
                        setState(() {
                          widget.profile.setHeight(value);
                        });
                      },
                    ),
                    _buildSliderRow(
                      name: 'Weight',
                      value: widget.profile.weight,
                      minValue: 40,
                      maxValue: 150,
                      onChanged: (value) {
                        setState(() {
                          widget.profile.setWeight(value);
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
                  percent: widget.profile.profileCompleted / 100,
                  center: Text(
                    "${widget.profile.profileCompleted.toString()} %",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
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
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: children,
      ),
    ));
  }
}
