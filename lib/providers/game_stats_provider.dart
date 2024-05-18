import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameStatsNotifier extends StateNotifier<List<RoundStat>> {
  GameStatsNotifier() : super([]);

  void addRound(RoundStat colorRoundStat) {
    state = [...state, colorRoundStat];
  }

  void clear() {
    state = [];
  }
}

final gameStatsProvider =
    StateNotifierProvider<GameStatsNotifier, List<RoundStat>>(
  (ref) => GameStatsNotifier(),
);
