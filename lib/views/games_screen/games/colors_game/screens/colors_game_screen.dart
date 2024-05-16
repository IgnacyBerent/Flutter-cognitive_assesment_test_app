import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:cognitive_assesment_test_app/views/games_screen/games/colors_game/screens/color_game_result_screen.dart';

class ColorsGameScreen extends StatefulWidget {
  const ColorsGameScreen({
    super.key,
    required this.game,
    required this.randomBgColors,
    required this.randomColorNames,
    required this.randomTextColor,
    required this.randomTextWeights,
    required this.anwsers,
  });

  final int game;
  final List<Color> randomBgColors;
  final List<String> randomColorNames;
  final List<Color> randomTextColor;
  final List<FontWeight> randomTextWeights;
  final List<String> anwsers;

  @override
  State<ColorsGameScreen> createState() => _ColorsGameScreenState();
}

class _ColorsGameScreenState extends State<ColorsGameScreen> {
  final random = math.Random();
  final _speech = SpeechRecognition();

  @override
  void initState() {
    super.initState();
    initSpeechRecognition();
  }

  void initSpeechRecognition() {
    _speech.setRecognitionStartedHandler(() {
      _speech.listen().then((result) => log('$result'));
    });
    _speech.setRecognitionResultHandler((String speech) {
      if (widget.randomColorNames.contains(speech.toUpperCase())) {
        final newGame = widget.game + 1;
        if (newGame < 5) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ColorsGameScreen(
                  game: newGame,
                  randomBgColors: widget.randomBgColors,
                  randomColorNames: widget.randomColorNames,
                  randomTextColor: widget.randomTextColor,
                  randomTextWeights: widget.randomTextWeights,
                  anwsers: [...widget.anwsers, speech.toUpperCase()]),
            ),
          ).then((_) => initSpeechRecognition());
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ColorGameResultScreen(
                  results:
                      widget.randomColorNames.asMap().map((index, colorName) {
                return MapEntry(colorName, widget.anwsers[index]);
              })),
            ),
          );
        }
      } else {
        initSpeechRecognition();
      }
    });
    _speech.activate('en_US').then((res) {
      if (res) {
        _speech.listen();
      }
    });
    _speech.setErrorHandler(() {
      initSpeechRecognition();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: widget.randomBgColors[widget.game],
        child: Stack(
          children: [
            Center(
              child: Text(
                widget.randomColorNames[widget.game],
                style: GoogleFonts.roboto(
                  fontSize: 50,
                  color: widget.randomTextColor[widget.game],
                  fontWeight: widget.randomTextWeights[widget.game],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
