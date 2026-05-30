import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});
  final double fill;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 6),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              gradient: LinearGradient(
                colors: [Color(0xff7F5AF0), Color.fromARGB(255, 24, 156, 204)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
