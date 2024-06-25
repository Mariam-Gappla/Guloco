
import 'package:flutter/material.dart';

class TwoSquareContainer extends StatelessWidget {
  const TwoSquareContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffD9D9D9),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffD9D9D9),
            ),
            // child: const pedoometer(),
          ),
        ),
      ],
    );
  }
}
