import 'package:flutter/material.dart';

class CustomButtonHome extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const CustomButtonHome({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    this.borderRadius = 30.0,
    required this.onPressed,
    this.width = double.infinity,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
