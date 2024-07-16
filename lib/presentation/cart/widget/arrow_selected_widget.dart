import 'package:flutter/material.dart';

class ArrowSelectedWidget extends StatelessWidget {
  final String title;
  final String option;
  const ArrowSelectedWidget(
      {super.key, required this.title, required this.option});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title:",
          style: const TextStyle(fontSize: 13),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(3),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              option,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
