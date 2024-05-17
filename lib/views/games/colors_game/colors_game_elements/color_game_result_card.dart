import 'package:flutter/material.dart';

import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:cognitive_assesment_test_app/widgets/cards/result_card.dart';

class ColorGameResultCard extends StatelessWidget {
  const ColorGameResultCard({
    super.key,
    required this.roundStat,
    required this.index,
  });

  final ColorRoundStat roundStat;
  final int index;

  @override
  Widget build(BuildContext context) {
    final correct = roundStat.correctAnwser == roundStat.userAnwser;

    return ResultCard(
      index: index,
      indexIconColor: correct
          ? const Color.fromARGB(255, 14, 116, 17)
          : const Color.fromARGB(255, 194, 0, 65),
      resultTextFields: <Widget>[
        Text(
          'Correct: ${roundStat.correctAnwser}',
          style: resultsTextStyle,
        ),
        Text(
          'Anwser: ${roundStat.userAnwser}',
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
