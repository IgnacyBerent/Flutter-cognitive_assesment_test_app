class GameScore {
  final double score;
  final DateTime date;

  GameScore({
    required this.score,
    required this.date,
  });

  factory GameScore.fromMap(Map<String, dynamic> map) {
    return GameScore(
      score: map['score'] as double,
      date: DateTime.parse(map['date'] as String),
    );
  }
}
