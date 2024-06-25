import 'package:flutter/material.dart';
class Warning extends StatelessWidget {
  String path;
  String text;
   Warning(this.path,this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 10),
      child: Row(
        children: [
        Image.asset(path,width: 94,height: 120),
        Padding(padding: EdgeInsets.only(right: 20 )),
        Container(
          width: 250,
            child: Text("$text")),
      ],),
    );
  }
}
