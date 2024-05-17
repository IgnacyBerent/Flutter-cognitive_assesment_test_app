import 'package:flutter/material.dart';

class MicButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool isOn;

  const MicButton({
    super.key,
    required this.onPressed,
    this.width = 80,
    this.height = 80,
    this.isOn = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.yellow,
            Colors.purple,
            Colors.orange,
            Colors.pink,
            Colors.brown,
          ],
        ),
        borderRadius: BorderRadius.circular(9999),
      ),
      width: width,
      height: height,
      child: IconButton(
        onPressed: onPressed,
        icon: isOn ? const Icon(Icons.stop) : const Icon(Icons.mic),
        iconSize: 50,
        color: Colors.white,
      ),
    );
  }
}
