import 'dart:math' as math;

import 'package:cognitive_assesment_test_app/widgets/buttons/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cognitive_assesment_test_app/models/game_stats/numbers_round_stat.dart';
import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/numbers_game/screens/numbers_game_results_screen.dart';

import 'dart:developer';

class NumbersGameScreen extends ConsumerStatefulWidget {
  const NumbersGameScreen({
    super.key,
    required this.numberOfRounds,
  });

  final int numberOfRounds;

  @override
  ConsumerState<NumbersGameScreen> createState() => _NumbersGameScreenState();
}

class _NumbersGameScreenState extends ConsumerState<NumbersGameScreen> {
  final Stopwatch _stopwatch = Stopwatch();
  FlutterTts flutterTts = FlutterTts();
  final random = math.Random();
  final currentNumbers = <int>[];
  TextEditingController numbersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(0.2);
    _startRound();
  }

  void _startRound() {
    numbersController.clear();
    _stopwatch.reset();
    const n = 6;
    currentNumbers.clear();
    for (var i = 0; i < n; i++) {
      final number = random.nextInt(10);
      currentNumbers.add(number);
    }
    flutterTts.speak(currentNumbers.join(' '));
    _stopwatch.start();
  }

  void submitAnwser() {
    _stopwatch.stop();
    final time = _stopwatch.elapsedMilliseconds;
    final typedNumbers = numbersController.text;
    final userAnwser = typedNumbers.split('').map(int.parse).toList();
    log('User anwser: $userAnwser');
    final correctAnwser = currentNumbers.reversed.toList();
    final roundStat = NumbersRoundStat(
      correctAnswer: correctAnwser,
      userAnswer: userAnwser,
      time: time,
    );
    ref.read(gameStatsProvider.notifier).addRound(roundStat);
    if (ref.read(gameStatsProvider).length < widget.numberOfRounds) {
      _startRound();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const NumbersGameResultsScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TextField(
                  controller: numbersController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    fillColor: Color.fromARGB(10, 255, 255, 255),
                    hintText: 'Enter your text here',
                    hintStyle: TextStyle(letterSpacing: 2),
                  ),
                  style: GoogleFonts.roboto(
                    fontSize: 50,
                    color: const Color.fromARGB(255, 228, 228, 228),
                    fontWeight: FontWeight.w800,
                    letterSpacing: 5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MyTextButton(
                  onPressed: () {
                    submitAnwser();
                  },
                  buttonText: 'SUBMIT',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    numbersController.dispose();
    super.dispose();
  }
}
