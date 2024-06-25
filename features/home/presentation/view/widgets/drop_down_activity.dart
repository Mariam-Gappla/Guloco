import 'package:flutter/material.dart';

class DropdownActivity extends StatelessWidget {
  DropdownActivity({this.onChanged});

  @override
  String? selectedItem;
  final Function(String?)? onChanged;

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            disabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
    
          hint: const Text("النشاط"),
          value: selectedItem,
          items: ["مشى","جرى"].map((e){
            return DropdownMenuItem<String>(
              child: Text("$e"),
              value: e,
            );
          }).toList(),
          onChanged: (value){
            onChanged!(value);
          },
          validator: (value){
              if (value == null) {
                return 'Please select an option';
              }
              return null; 
            }
          )
          
    );
  }
}

