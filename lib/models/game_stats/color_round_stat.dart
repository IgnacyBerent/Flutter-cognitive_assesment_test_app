import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'correctAnwser': correctAnwser,
      'userAnwser': userAnwser,
      'time': time,
    };
  }

  String toJson() => json.encode(toMap());
}
