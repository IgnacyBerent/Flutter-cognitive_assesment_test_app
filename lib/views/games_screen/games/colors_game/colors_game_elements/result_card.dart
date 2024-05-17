import 'package:flutter/material.dart';

import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:cognitive_assesment_test_app/widgets/icons/index_icon.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.roundStat, required this.index});

  final ColorRoundStat roundStat;
  final int index;

  @override
  Widget build(BuildContext context) {
    final correct = roundStat.correctAnwser == roundStat.userAnwser;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(64, 61, 232, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Expanded(
        child: Row(
          children: [
            IndexIcon(index: index, correct: correct),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
