import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

class ColorRoundStat extends RoundStat {
  String correctAnwser;
  String userAnwser;
  int time;

  ColorRoundStat({
    required this.correctAnwser,
    required this.userAnwser,
    required this.time,
  });
}
