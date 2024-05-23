import 'package:flutter/material.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';

class IndexIcon extends StatelessWidget {
  const IndexIcon({super.key, required this.index, required this.color});

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Center(
          child: Text(
            (index + 1).toString(),
            style: numberIndexTextStyle,
          ),
        ),
      ),
    );
  }
}
