import 'package:flutter/material.dart';

class CenterView extends StatelessWidget {
  const CenterView({
    super.key,
    required this.child,
    this.topPadding = 50,
    this.bottomPadding = 40,
  });

  final Widget child;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, topPadding, 25, bottomPadding),
      child: Center(
        child: child,
      ),
    );
  }
}
