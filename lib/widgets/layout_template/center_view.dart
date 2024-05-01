import 'package:flutter/material.dart';

class CenterView extends StatelessWidget {
  const CenterView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 50, 25, 40),
      child: Center(
        child: child,
      ),
    );
  }
}
