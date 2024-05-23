import 'dart:convert';

import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

class NumbersRoundStat extends RoundStat {
  List<int> correctAnwser;
  List<int> userAnwser;
  int time;

  NumbersRoundStat({
    required this.correctAnwser,
    required this.userAnwser,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'correctAnwser': correctAnwser,
      'userAnwser': userAnwser,
      'time': time,
    };
  }

  String toJson() => json.encode(toMap());
}
