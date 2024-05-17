import 'package:cognitive_assesment_test_app/models/game_stats/game_stat.dart';

class ColorRoundStat extends GameStat {
  String correctAnwser;
  String userAnwser;
  Duration time;

  ColorRoundStat({
    required this.correctAnwser,
    required this.userAnwser,
    required this.time,
  });
}
