import 'package:cognitive_assesment_test_app/models/game_stats/game_stat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameStatsNotifier extends StateNotifier<List<GameStat>> {
  GameStatsNotifier() : super([]);

  void addRound(GameStat colorRoundStat) {
    state = [...state, colorRoundStat];
  }

  void clear() {
    state = [];
  }
}

final gameStatsProvider =
    StateNotifierProvider<GameStatsNotifier, List<GameStat>>(
  (ref) => GameStatsNotifier(),
);
