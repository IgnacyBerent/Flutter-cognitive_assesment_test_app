import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/animated_background_container.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/blur_cover.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/center_view.dart';
import 'package:flutter/material.dart';

class GameLayoutTemplate extends StatelessWidget {
  const GameLayoutTemplate({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const AnimatedBackgroundContainer(),
          const BlurCover(),
          CenterView(
            topPadding: 50,
            bottomPadding: 40,
            child: child,
          ),
        ],
      ),
    );
  }
}
