import 'package:flutter/material.dart';

class CustomTextFieldMa extends StatelessWidget {
  String? text2;
  String text3;
  CustomTextFieldMa(this.text2, this.text3, {super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          hintText: text3,
          suffix: Text("$text2", style: const TextStyle(color: Colors.black87)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff000),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color(0xff000),
            ),
          ),
        ),
      ),
    );
  }
}
