import 'package:flutter/material.dart';
import 'package:gluco/core/helper/cach.dart';
import 'package:gluco/features/auth/presentation/view/login.dart';

void signOut(context) {
  ChachHelper.removeData(key: 'token')!.then((value) => {
        if (value == true)
          {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            )
          }
      });
}