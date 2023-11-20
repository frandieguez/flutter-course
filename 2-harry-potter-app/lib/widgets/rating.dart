import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.value, this.color, this.onRating});

  final double value;
  final Color? color;
  final Function(double)? onRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            child: (value >= i)
                ? Icon(Icons.star, color: color)
                : Icon(Icons.star_border_outlined, color: color),
            onTap: () {
              onRating?.call(i.toDouble());
            },
          ),
      ],
    );
  }
}
