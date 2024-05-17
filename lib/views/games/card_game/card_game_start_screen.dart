import 'package:flutter/material.dart';

import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/start_screen_layout_template.dart';

class CardGameStartScreen extends StatelessWidget {
  const CardGameStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StartScreenLayoutTemplate(
      gameName: "Card",
      gameDescription:
          "In this game, you will be shown a hand of covered cards. You have to remember the position of the cards and match them with their pairs.",
      exampleImage: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Image.asset("assets/images/card_game_example.png"),
      ),
      roundsDescription:
          "In each round you have 12 pictures to match and the game consists of 3 games.\n Good luck!",
      onPressed: () {
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const CardGameScreen();
            },
          ),
        );
      },
    );
  }
}
