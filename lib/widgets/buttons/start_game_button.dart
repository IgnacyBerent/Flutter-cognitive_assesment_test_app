import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';

class StartGameButton extends StatefulWidget {
  final VoidCallback onPressed;

  const StartGameButton({
    super.key,
    required this.onPressed,
  });

  @override
  State<StartGameButton> createState() => _StartGameButtonState();
}

class _StartGameButtonState extends State<StartGameButton> {
  int countdown = 3;
  bool isLoading = false;

  void startCountdown() {
    setState(() {
      isLoading = true;
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        timer.cancel();
        widget.onPressed();
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 80,
      child: ElevatedButton(
        onPressed: startCountdown,
        child: isLoading
            ? Stack(
                alignment: Alignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Text(
                    "$countdown",
                    style: countdownTextStyle,
                  ),
                ],
              )
            : Text(
                "START\nGAME",
                textAlign: TextAlign.center,
                style: buttonTextStyle,
              ),
      ),
    );
  }
}
