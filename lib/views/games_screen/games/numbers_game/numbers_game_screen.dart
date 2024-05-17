import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class NumbersGameScreen extends StatefulWidget {
  const NumbersGameScreen({super.key});

  @override
  State<NumbersGameScreen> createState() => _NumbersGameScreenState();
}

class _NumbersGameScreenState extends State<NumbersGameScreen> {
  late FocusNode myFocusNode;
  String typedNumbers = '';
  FlutterTts flutterTts = FlutterTts();
  final random = Random();
  final current_numbers = <int>[];
  TextEditingController numbersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage('en-IN');
    myFocusNode = FocusNode();
    startRound();
  }

  void startRound() {
    final n = random.nextInt(5) + 5;
    current_numbers.clear();
    for (var i = 0; i < n; i++) {
      final number = random.nextInt(10);
      current_numbers.add(number);
    }
    flutterTts.speak(current_numbers.join(' '));
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
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
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type your number',
                  ),
                  style: GoogleFonts.roboto(
                    fontSize: 50,
                    color: const Color.fromARGB(255, 228, 228, 228),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: () {
                  if (typedNumbers == current_numbers.join(' ')) {
                    typedNumbers = '';
                    numbersController.clear();
                    startRound();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
