import 'package:flutter/material.dart';

class BarAppOneDoc extends StatelessWidget {
  const BarAppOneDoc({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {},
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        const Text(
          "حجز",
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
