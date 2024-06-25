import 'package:flutter/material.dart';
class Time extends StatelessWidget {
  String time;
   Time(this.time);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:75,
      height: 29,
      margin: const EdgeInsets.only(left: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFE7EEF2),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(time,textAlign: TextAlign.center,),
      ),
    );
  }
}
