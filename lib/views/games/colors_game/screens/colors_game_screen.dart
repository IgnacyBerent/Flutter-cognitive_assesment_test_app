import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:string_similarity/string_similarity.dart';

import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/elements/colors_list.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/screens/color_game_results_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/mic_button.dart';

class ColorsGameScreen extends ConsumerStatefulWidget {
  const ColorsGameScreen({
    super.key,
    required this.numberOfRounds,
  });

  final int numberOfRounds;

  @override
  ConsumerState<ColorsGameScreen> createState() => _ColorsGameScreenState();
}

class _ColorsGameScreenState extends ConsumerState<ColorsGameScreen> {
  final random = math.Random();
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _isListening = false;
  final randomBgColors = <Color>[];
  final randomColorNames = <String>[];
  final randomTextColor = <Color>[];
  final randomTextWeights = <FontWeight>[];
  int currentGame = 0;
  final Stopwatch _stopwatch = Stopwatch();

  @override
  void initState() {
    _initColors();
    super.initState();
    _initSpeech();
  }

  void _initColors() {
    for (int i = 0; i < widget.numberOfRounds; i++) {
      randomBgColors.add(colorsList[random.nextInt(colorsList.length)]);
      randomColorNames
          .add(colorsNamesList[random.nextInt(colorsNamesList.length)]);
      randomTextColor.add(colorsList[random.nextInt(colorsList.length)]);
      randomTextWeights.add(FontWeight.values[random.nextInt(9)]);
    }
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    log('Speech enabled: $_speechEnabled');
    setState(() {});
  }

  void _startListening() async {
    setState(() {
      _isListening = true;
    });
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
    }
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    log('Speech to text: ${result.recognizedWords}');
    String recognisedWord = _checkWord(result.recognizedWords);
    log('Recognition: $recognisedWord');
    if (colorsNamesList.contains(recognisedWord)) {
      _saveRound(recognisedWord);
      if (currentGame >= widget.numberOfRounds - 1) {
        _stopListening();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) {
              return const ColorGameResultsScreen();
            },
          ),
        );
      } else {
        setState(() {
          currentGame++;
        });
        _stopListening();
      }
    }
  }

  void _saveRound(String userAnwser) {
    _stopwatch.stop();
    final ColorRoundStat roundStat = ColorRoundStat(
      correctAnswer: randomColorNames[currentGame],
      userAnswer: userAnwser,
      time: _stopwatch.elapsedMilliseconds,
    );
    ref.read(gameStatsProvider.notifier).addRound(roundStat);
    _stopwatch.reset();
  }

  String _checkWord(String word) {
    String mostSimilarWord = '';
    double threshold = 0.3;
    for (String colorName in colorsNamesList) {
      double similarity = StringSimilarity.compareTwoStrings(
        word.toUpperCase(),
        colorName,
      );

      if (similarity >= threshold) {
        threshold = similarity;
        mostSimilarWord = colorName;
      }
    }

    return threshold >= 0.30 ? mostSimilarWord : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: randomBgColors[currentGame],
        child: Stack(
          children: [
            Center(
              child: Text(
                _isListening ? randomColorNames[currentGame] : '',
                style: GoogleFonts.roboto(
                  fontSize: 50,
                  color: randomTextColor[currentGame],
                  fontWeight: randomTextWeights[currentGame],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: MicButton(
                  onPressed: () {
                    _isListening ? _stopListening() : _startListening();
                  },
                  isOn: _isListening,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
