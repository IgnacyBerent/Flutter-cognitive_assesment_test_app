import 'package:flutter/material.dart';

import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/start_game_button.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';

/// `StartScreenLayoutTemplate` is a StatelessWidget that provides a layout for the start screen of a game.
///
/// It takes in several parameters that define the game's name, description, example image, rounds description, and a function to be executed when a button is pressed.
/// An optional parameter for image description is also provided.
/// After pressing the start game button, given game starts after 3 seconds.
///
/// The `build` method returns a `LayoutTemplate` widget that contains a `Column` widget. The `Column` widget includes various widgets that display the game's details.
///
/// Fields:
/// - `gameName`: A string that holds the name of the game.
/// - `gameDescription`: A string that holds the description of the game.
/// - `exampleImage`: A widget that holds the example image of the game.
/// - `imageDescription`: An optional string that holds the description of the image.
/// - `roundsDescription`: A string that holds the description of the rounds in the game.
/// - `onPressed`: A function that is executed when the start game button is pressed.
///
/// Methods:
/// - `build(BuildContext context)`: A method that returns a `LayoutTemplate` widget. The `LayoutTemplate` contains a `Column` widget that displays the game's details.
class StartScreenLayoutTemplate extends StatelessWidget {
  const StartScreenLayoutTemplate({
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
