import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class BarApp extends StatelessWidget {
  const BarApp({super.key});

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
          "دكتور",
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          child: const Icon(Iconsax.notification),
        ),
      ],
    );
  }
}
