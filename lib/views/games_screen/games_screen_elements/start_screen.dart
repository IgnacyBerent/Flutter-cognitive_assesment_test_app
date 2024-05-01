import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cognitive_assesment_test_app/widgets/buttons/start_game_button.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.gameName,
    required this.gameDescription,
    required this.exampleImage,
    required this.roundsDescription,
    required this.onPressed,
    this.imageDescription,
  });

  final String gameName;
  final String gameDescription;
  final Widget exampleImage;
  final String? imageDescription;
  final String roundsDescription;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: "$gameName Game",
      child: Column(
        children: [
          Text(
            "Welcome to the $gameName Game!",
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            gameDescription,
            style: GoogleFonts.karla(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          exampleImage,
          imageDescription != null
              ? Text(
                  "In this case, the answer is red.",
                  style: GoogleFonts.karla(
                    fontSize: 14,
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Text(
            roundsDescription,
            style: GoogleFonts.karla(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          StartGameButton(
            onPressed: () {
              onPressed();
            },
          ),
        ],
      ),
    );
  }
}
