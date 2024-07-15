import 'package:flutter/material.dart';

class SelectedBoxWidget extends StatelessWidget {
  final String content;
  final bool isSelected;
  final double? padding;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  const SelectedBoxWidget(
      {super.key,
      required this.content,
      required this.isSelected,
      this.padding,
      this.radius,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : null,
          border: Border.all(color: isSelected ? Colors.black : Colors.grey),
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 10),
          child: Text(
            content,
            style: TextStyle(
              color: !isSelected ? Colors.black : Colors.white,
              fontSize: 15,
              // fontWeight: FontWeight.bold
            ),
          ),
        ));
  }
}
