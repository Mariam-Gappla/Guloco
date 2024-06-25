import 'package:flutter/material.dart';

class ChartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'لا توجد بيانات',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}