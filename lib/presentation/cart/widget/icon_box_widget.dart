import 'package:flutter/material.dart';

class IconBoxWidget extends StatelessWidget {
  final bool isSelected;
  final double? padding;
  final Widget icon;
  final double? radius;
  const IconBoxWidget(
      {super.key,
      required this.isSelected,
      this.padding,
      required this.icon,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : null,
          border: Border.all(color: isSelected ? Colors.black : Colors.grey),
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
        child: Padding(padding: EdgeInsets.all(padding ?? 10), child: icon));
  }
}
