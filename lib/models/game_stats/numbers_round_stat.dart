import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

class NumbersRoundStat extends RoundStat {
  List<int> correctAnswer;
  List<int> userAnswer;
  int time;

  NumbersRoundStat({
    required this.correctAnswer,
    required this.userAnswer,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'correctAnswer': correctAnswer,
      'userAnswer': userAnswer,
      'time': time,
    };
  }
}
