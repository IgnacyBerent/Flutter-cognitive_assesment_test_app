import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cognitive_assesment_test_app/models/game_stats/cards_round_stat.dart';
import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/card_object.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/card_state.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/cards_list.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/match_game_card.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/screens/card_game_results_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/game_layout_template.dart';

class CardGameScreen extends ConsumerStatefulWidget {
  const CardGameScreen({super.key, required this.numberOfRounds});

  final int numberOfRounds;

  @override
  ConsumerState<CardGameScreen> createState() => _CardGameScreenState();
}

class _CardGameScreenState extends ConsumerState<CardGameScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  List<CardObject> cards = [];
  List<CardObject> tappedCards = [];
  int wrongMatches = 0;

  @override
  void initState() {
    super.initState();
    cards = _getCards();
    _startRound();
  }

  void _startRound() {
    // Set all cards' state to tapped
    for (var card in cards) {
      card.state = CardState.tapped;
    }

    // After a delay of one second, set all cards' state back to unTapped
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        for (var card in cards) {
          card.state = CardState.unTapped;
        }
      });
      _stopwatch.start();
    });
  }

  List<CardObject> _getCards() {
    final random = Random();
    List<CardObject> cards = [];
    // If there are less than 6 cards, just return all of them
    if (cardsList.length <= 6) {
      cards = List<CardObject>.from(cardsList);
    } else {
      // Pick 6 random cards
      for (int i = 0; i < 6; i++) {
        final index = random.nextInt(cardsList.length);
        cards.add(cardsList[index]);
        cardsList.removeAt(index);
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

  void _checkWinningCondition() {
    if (cards.every((card) => card.state == CardState.matched)) {
      _stopwatch.stop();
      final time = _stopwatch.elapsedMilliseconds;
      final roundStat = CardsRoundStat(
        time: time,
        wrongMatches: wrongMatches,
      );
      ref.read(gameStatsProvider.notifier).addRound(roundStat);
      if (ref.read(gameStatsProvider).length < widget.numberOfRounds) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return CardGameScreen(
                numberOfRounds: widget.numberOfRounds,
              );
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const CardGameResultsScreen();
            },
          ),
        );
      }
    }
  }

  void _matchCards() {
    if (tappedCards[0].name == tappedCards[1].name) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          tappedCards[0].state = CardState.matched;
          tappedCards[1].state = CardState.matched;
          tappedCards = [];
        });
        _checkWinningCondition();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          tappedCards[0].state = CardState.unTapped;
          tappedCards[1].state = CardState.unTapped;
          tappedCards = [];
        });
        wrongMatches++;
      });
    }
  }

  void _tapCard(CardObject card) {
    setState(() {
      card.state = CardState.tapped;
      tappedCards.add(card);
    });
    if (tappedCards.length == 2) {
      _matchCards();
    }
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
                        _tapCard(card);
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
