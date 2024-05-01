import 'package:cognitive_assesment_test_app/views/games_screen/games_screen_elements/game_card.dart';
import 'package:cognitive_assesment_test_app/views/games_screen/games_screen_elements/games_list.dart';
import 'package:flutter/material.dart';

class GamesScreen extends StatelessWidget {
  GamesScreen({super.key});

  final games = gamesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        final game = games[index];
        return GameCard(
          imagePath: game.imagePath,
          cardTitle: game.name,
          description: game.description,
          gameOnTap: () {
            game.gameOnTap(context);
          },
        );
      },
    );
  }
}
