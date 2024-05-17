import 'package:flutter/material.dart';

import 'package:cognitive_assesment_test_app/views/games/card_game/screens/card_game_start_screen.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/screens/colors_game_start_screen.dart';
import 'package:cognitive_assesment_test_app/views/games/numbers_game/screens/numbers_game_start_screen.dart';
import 'package:cognitive_assesment_test_app/views/games_screen/games_screen_elements/game_object.dart';

final gamesList = [
  GameObject(
    id: 1,
    name: "Numbers Game",
    description: "Test your memory with this numbers game",
    imagePath: "assets/images/numbers_game.png",
    gameOnTap: (context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CardGameStartScreen(),
      ),
    ),
  ),
  GameObject(
    id: 2,
    name: "Colors Recognition Game",
    description: "Test your speed with this colors game",
    imagePath: "assets/images/colors_game.png",
    gameOnTap: (context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ColorsGameStartScreen(),
      ),
    ),
  ),
  GameObject(
    id: 3,
    name: "Numbers Repetition Game",
    description: "Test you memory with this numbers game",
    imagePath: "assets/images/numbers_game.png",
    gameOnTap: (context) => Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NumbersGameStartScreen(),
      ),
    ),
  ),
];
