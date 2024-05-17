import 'package:flutter/material.dart';
import 'package:cognitive_assesment_test_app/widgets/icons/index_icon.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.index,
    required this.indexIconColor,
    required this.resultTextFields,
  });

  final int index;
  final Color indexIconColor;
  final List<Widget> resultTextFields;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(64, 61, 232, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Expanded(
        child: Row(
          children: [
            IndexIcon(
              index: index,
              color: indexIconColor,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: resultTextFields,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
