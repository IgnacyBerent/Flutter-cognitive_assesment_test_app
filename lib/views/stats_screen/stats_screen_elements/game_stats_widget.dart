import 'package:cognitive_assesment_test_app/models/dtos/game_score.dart';
import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:cognitive_assesment_test_app/views/stats_screen/stats_screen_elements/test_results_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GameStatsWidget extends StatelessWidget {
  const GameStatsWidget({
    required this.gameStats,
    required this.gameName,
    required this.isBelowAverage,
    super.key,
  });

  final List<GameScore> gameStats;
  final String gameName;
  final bool isBelowAverage;

  @override
  Widget build(BuildContext context) {
    if (gameStats.isEmpty) {
      return Container();
    }

    final seriesList = [
      LineSeries<GameScore, DateTime>(
        dataSource: gameStats,
        xValueMapper: (GameScore score, _) => score.date,
        yValueMapper: (GameScore score, _) => score.score,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          Text(
            gameName,
            style: titleTextStyle,
          ),
          SizedBox(
            height: 300,
            child: TestResultsChart(seriesList),
          ),
          Text(
            isBelowAverage ? "Below average" : "Above average",
            style:
                isBelowAverage ? belowAverageTextStyle : aboveAverageTextStyle,
          ),
        ],
      ),
    );
  }
}
