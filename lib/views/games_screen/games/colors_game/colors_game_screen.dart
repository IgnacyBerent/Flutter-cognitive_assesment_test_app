import 'dart:math';
import 'package:cognitive_assesment_test_app/views/games_screen/games/colors_game/colors_game_elements/colors_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsGameScreen extends StatefulWidget {
  const ColorsGameScreen({super.key});

  @override
  State<ColorsGameScreen> createState() => _ColorsGameScreenState();
}

class _ColorsGameScreenState extends State<ColorsGameScreen> {
  final colors = colorsList;
  final colorsNames = colorsNamesList;
  final random = Random();

  Color getRandomColor() {
    return colors[random.nextInt(colors.length)];
  }

  String getRandomColorName() {
    return colorsNames[random.nextInt(colorsNames.length)];
  }

  FontWeight getRandomFontWeight() {
    return FontWeight.values[random.nextInt(FontWeight.values.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: getRandomColor(),
        child: Center(
          child: Text(
            getRandomColorName(),
            style: GoogleFonts.roboto(
              fontSize: 50,
              color: getRandomColor(),
              fontWeight: getRandomFontWeight(),
            ),
          ),
        ),
      ),
    );
  }
}
