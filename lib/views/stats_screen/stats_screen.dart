import 'package:cognitive_assesment_test_app/api/database.dart';
import 'package:cognitive_assesment_test_app/models/dtos/game_score.dart';
import 'package:cognitive_assesment_test_app/views/stats_screen/stats_screen_elements/game_stats_widget.dart';
import 'package:cognitive_assesment_test_app/views/stats_screen/stats_screen_elements/id_to_game_map.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final db = DatabaseApi();

  late final stats = <List<GameScore>>[];
  late final averages = <bool>[];

  @override
  void initState() {
    super.initState();
    getStats();
  }

  Future<void> getStats() async {
    final cardsGameStats = await db.getGamesScores(gameId: 1);
    final colorGameStats = await db.getGamesScores(gameId: 2);
    final numbersGameStats = await db.getGamesScores(gameId: 3);
    final cardsBelowAverage = await db.isBelowAverage(gameId: 1);
    final colorBelowAverage = await db.isBelowAverage(gameId: 2);
    final numbersBelowAverage = await db.isBelowAverage(gameId: 3);
    if (mounted) {
      setState(() {
        stats.addAll([cardsGameStats, colorGameStats, numbersGameStats]);
        averages.addAll(
            [cardsBelowAverage, colorBelowAverage, numbersBelowAverage]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        if (stats.length > index) {
          return GameStatsWidget(
            gameName: idToGameMap[index + 1],
            gameStats: stats[index],
            isBelowAverage: averages[index],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
