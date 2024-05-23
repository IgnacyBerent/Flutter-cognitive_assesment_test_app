import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/animated_background_container.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/blur_cover.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/center_view.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/layout_app_bar.dart';
import 'package:flutter/material.dart';

class FormLayoutTemplate extends StatelessWidget {
  const FormLayoutTemplate({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: const LayoutAppBar(
        title: '',
      ),
      body: Stack(
        children: [
          const AnimatedBackgroundContainer(),
          const BlurCover(),
          CenterView(
            topPadding: 0,
            bottomPadding: 20,
            xPadding: 2,
            child: child,
          ),
        ],
      ),
    );
  }
}
