import 'package:flutter/material.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';

class IndexIcon extends StatelessWidget {
  const IndexIcon({super.key, required this.index, required this.correct});

  final int index;
  final bool correct;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: correct
              ? const Color.fromARGB(255, 14, 116, 17)
              : const Color.fromARGB(255, 194, 0, 65),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Center(
          child: Text(
            index.toString(),
            style: numberIndexTextStyle,
          ),
        ),
      ),
    );
  }
}
