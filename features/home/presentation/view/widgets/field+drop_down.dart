import 'package:flutter/material.dart';

class CustomTextFieldDropdown extends StatelessWidget {
  CustomTextFieldDropdown({this.mealname});

  @override
  String? selectedItem;
Function(String?)? mealname;

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
    
        hint: const Text("اسم الوجبه"),
         value: selectedItem,
         items: ["فطار","غذاء","عشاء"].map((e){
           return DropdownMenuItem<String>(
             child: Text("$e"),
             value: e,
           );
         }).toList(),
          onChanged: (value){
            mealname!(value);

          },
          validator: (value){
              if (value == null) {
                return 'Please select an option';
              }
              return null; 
            }
          ),
    );
  }
}
