import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';
import 'package:flutter/material.dart';

class ColorGameResultScreen extends StatelessWidget {
  const ColorGameResultScreen({
    super.key,
    required this.results,
  });

  final Map<String, String> results;

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: "Color Game Results!",
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Your Results:",
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final color = results.keys.elementAt(index);
                final answer = results[color];
                return ListTile(
                  title: Text(
                    color,
                  ),
                  subtitle: Text(
                    answer!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
