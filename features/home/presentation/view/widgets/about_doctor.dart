import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({
    super.key,
    required this.docs,
  });
  final DoctorModel docs;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "عن الطبيب",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        // Text(" الزيارات : (150) "),
        Text(
          docs.about.toString(),
        ),
      ],
    );
  }
}
