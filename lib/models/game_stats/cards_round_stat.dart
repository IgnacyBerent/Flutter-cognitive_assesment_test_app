// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

class CardsRoundStat extends RoundStat {
  int wrongMatches;
  int time;

  CardsRoundStat({
    required this.wrongMatches,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wrongMatches': wrongMatches,
      'time': time,
    };
  }

  String toJson() => json.encode(toMap());
}
