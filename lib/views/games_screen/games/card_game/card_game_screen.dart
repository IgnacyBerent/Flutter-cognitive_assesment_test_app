import 'package:cognitive_assesment_test_app/views/games_screen/games/card_game/card_game_elements/card_object.dart';
import 'package:cognitive_assesment_test_app/views/games_screen/games/card_game/card_game_elements/card_state.dart';
import 'package:cognitive_assesment_test_app/views/games_screen/games/card_game/card_game_elements/cards_list.dart';
import 'package:cognitive_assesment_test_app/views/games_screen/games/card_game/card_game_elements/match_game_card.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/game_layout_template.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CardGameScreen extends StatefulWidget {
  const CardGameScreen({super.key});

  @override
  State<CardGameScreen> createState() => _CardGameScreenState();
}

class _CardGameScreenState extends State<CardGameScreen> {
  List<CardObject> cards = [];
  List<CardObject> tappedCards = [];

  void matchCards() {
    if (tappedCards[0].name == tappedCards[1].name) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          tappedCards[0].state = CardState.matched;
          tappedCards[1].state = CardState.matched;
          tappedCards = [];
        });
      });
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          tappedCards[0].state = CardState.unTapped;
          tappedCards[1].state = CardState.unTapped;
          tappedCards = [];
        });
      });
    }
  }

  void tapCard(CardObject card) {
    setState(() {
      card.state = CardState.tapped;
      tappedCards.add(card);
    });
    if (tappedCards.length == 2) {
      matchCards();
    }
  }

  List<CardObject> getCards(List<CardObject> cardsList) {
    final allCards = cardsList;
    final random = Random();
    List<CardObject> cards = [];
    // If there are less than 6 cards, just return all of them
    if (allCards.length <= 6) {
      cards = List<CardObject>.from(allCards);
    } else {
      // Pick 6 random cards
      for (int i = 0; i < 6; i++) {
        final index = random.nextInt(allCards.length);
        cards.add(allCards[index]);
        allCards.removeAt(index);
      }
    }
    // Duplicate them
    final cardsDuplicate = cards
        .map((card) =>
            CardObject(name: card.name, image: card.image, state: card.state))
        .toList();
    cards = [...cards, ...cardsDuplicate];
    // Shuffle the list
    cards.shuffle();
    return cards;
  }

  @override
  void initState() {
    super.initState();
    cards = getCards(cardsList);
  }

  @override
  Widget build(BuildContext context) {
    return GameLayoutTemplate(
      child: SizedBox(
        height:
            450, // To prevent the GridView from starting at the top of the screen
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final card = cards[index];
            return InkWell(
              onTap: tappedCards.length < 2
                  ? () {
                      if (card.state == CardState.unTapped) {
                        tapCard(card);
                      }
                    }
                  : null,
              child: MatchGameCard(
                cardState: card.state,
                cardImage: card.image,
              ),
            );
          },
        ),
      ),
    );
  }
}
