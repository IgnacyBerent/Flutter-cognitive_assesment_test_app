import 'package:cognitive_assesment_test_app/models/game_stats/numbers_round_stat.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:cognitive_assesment_test_app/widgets/cards/result_card.dart';
import 'package:flutter/material.dart';

class NumbersGameResultCard extends StatelessWidget {
  const NumbersGameResultCard({
    super.key,
    required this.roundStat,
    required this.index,
  });

  final NumbersRoundStat roundStat;
  final int index;

  @override
  Widget build(BuildContext context) {
    final correct = roundStat.correctAnswer == roundStat.userAnswer;
    return ResultCard(
      index: index,
      indexIconColor: correct
          ? const Color.fromARGB(255, 14, 116, 17)
          : const Color.fromARGB(255, 194, 0, 65),
      resultTextFields: <Widget>[
        Text(
          'Correct: ${roundStat.correctAnswer.join(' ')}',
          style: resultsTextStyle,
        ),
        Text(
          'Anwser: ${roundStat.userAnswer.join(' ')}',
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
