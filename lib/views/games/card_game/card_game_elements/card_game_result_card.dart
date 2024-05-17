import 'package:cognitive_assesment_test_app/models/game_stats/cards_round_stat.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:cognitive_assesment_test_app/widgets/cards/result_card.dart';
import 'package:flutter/material.dart';

class CardGameResultCard extends StatelessWidget {
  const CardGameResultCard({
    super.key,
    required this.roundStat,
    required this.index,
  });

  final CardsRoundStat roundStat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ResultCard(
      index: index,
      indexIconColor: const Color.fromARGB(255, 15, 11, 240),
      resultTextFields: <Widget>[
        Text(
          'Wrong Matches: ${roundStat.wrongMatches}',
          style: resultsTextStyle,
        ),
        Text(
          'Time: ${roundStat.time.toString()}ms',
          style: resultsTextStyle,
        ),
      ],
    );
  }
}
