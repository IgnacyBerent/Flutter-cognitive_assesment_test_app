import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              )
            : Text(
                "START\n GAME",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
      ),
    );
  }
}
