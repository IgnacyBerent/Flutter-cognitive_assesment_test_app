import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/card_state.dart';

class CardObject {
  String name;
  String image;
  CardState state;

  CardObject({
    required this.name,
    required this.image,
    this.state = CardState.unTapped,
  });
}
