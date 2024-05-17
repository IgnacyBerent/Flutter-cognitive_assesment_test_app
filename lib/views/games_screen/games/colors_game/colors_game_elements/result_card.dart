import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.roundStat, required this.index});

  final ColorRoundStat roundStat;
  final int index;

  @override
  Widget build(BuildContext context) {
    final correct = roundStat.correctAnwser == roundStat.userAnwser;
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(64, 61, 232, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Expanded(
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: correct
                      ? const Color.fromARGB(255, 14, 116, 17)
                      : const Color.fromARGB(255, 194, 0, 65),
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Center(
                  child: Text(
                    index.toString(),
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Correct: ${roundStat.correctAnwser}'),
                  Text('Anwser: ${roundStat.userAnwser}'),
                  Text('Time: ${roundStat.time.toString()}ms'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
