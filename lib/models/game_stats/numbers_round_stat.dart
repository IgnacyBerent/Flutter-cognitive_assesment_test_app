import 'package:cognitive_assesment_test_app/models/game_stats/game_stat.dart';

class NumbersRoundStat extends GameStat {
  List<int> correctAnwser;
  List<int> userAnwser;
  int time;

  NumbersRoundStat({
    required this.correctAnwser,
    required this.userAnwser,
    required this.time,
  });
}
