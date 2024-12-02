import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final String label;
  final Color color;

  const ProgressBar({
    required this.value,
    required this.label,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        LinearPercentIndicator(
          lineHeight: 14,
          percent: value,
          backgroundColor: Colors.grey[300]!,
          progressColor: color,
        ),
      ],
    );
  }
}
