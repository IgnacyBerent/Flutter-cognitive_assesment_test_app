import 'package:flutter/material.dart';

import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
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
            style: titleTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            gameDescription,
            style: descriptionTextStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          exampleImage,
          imageDescription != null
              ? Text(
                  "In this case, the answer is red.",
                  style: imageDescriptionTextStyle,
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Text(
            roundsDescription,
            style: descriptionTextStyle,
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
