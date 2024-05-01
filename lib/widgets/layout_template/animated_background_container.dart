import 'package:flutter/material.dart';

class AnimatedBackgroundContainer extends StatelessWidget {
  const AnimatedBackgroundContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 204, 231, 248),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
    );
  }
}
