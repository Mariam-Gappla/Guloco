import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gluco/features/settings/presentation/view/widget/form_profile.dart';

class ProfileScreen extends StatelessWidget {
  final String? imagePath; // استلام مسار الصورة هنا

  const ProfileScreen({Key? key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.white,
                child: imagePath != null
                    ? CircleAvatar(
                        radius: 60,
                        backgroundImage: FileImage(File(imagePath!)),
                      )
                    : const Icon(Icons.person),
              ),
              const SizedBox(
                width: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('01274975650'),

                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'ياسر ابراهيم ',
                    style: TextStyle(fontSize: 15),
                  ),

                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FormProfile(),

            ],
          ),
        ),
      ),
    );
  }
}
