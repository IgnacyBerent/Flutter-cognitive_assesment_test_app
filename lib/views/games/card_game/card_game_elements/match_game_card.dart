import 'package:flutter/material.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/card_state.dart';

class MatchGameCard extends StatelessWidget {
  const MatchGameCard({
    super.key,
    required this.cardState,
    required this.cardImage,
  });

  final CardState cardState;
  final String cardImage;

  @override
  Widget build(BuildContext context) {
    return cardState == CardState.matched
        ? Container()
        : Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: cardState == CardState.tapped ? Colors.white : Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: cardState == CardState.tapped
                ? Image.asset(cardImage)
                : Container(),
          );
  }
}
