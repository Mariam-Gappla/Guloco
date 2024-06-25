import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Services extends StatelessWidget {
  Services({
    super.key,
    this.text,
    required this.icon,
    this.onTap,
  });
  final String? text;
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffD9D9D9),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: Colors.black
            ),
            Text(
              text!,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
