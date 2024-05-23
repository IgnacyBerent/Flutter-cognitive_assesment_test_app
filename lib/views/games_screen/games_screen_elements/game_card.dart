import 'package:cognitive_assesment_test_app/styles/text_styles.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
    required this.imagePath,
    required this.cardTitle,
    required this.description,
    required this.gameOnTap,
  });

  final String imagePath;
  final String cardTitle;
  final String description;
  final Function gameOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        gameOnTap();
      },
      child: Card(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Text(
                      cardTitle,
                      style: gameCardTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        description,
                        style: gameCardDescriptionTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
