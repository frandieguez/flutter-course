import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  IconData icon = Icons.question_answer;
  String text = "";
  String value = "";

  DataCard({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Icon(
            this.icon,
            size: 50,
            color: Colors.white,
          ),
          Text(this.text, style: TextStyle(color: Colors.white)),
          Text(this.value,
              style: const TextStyle(fontSize: 20, color: Colors.white)),
        ],
      ),
    ));
  }
}
