// import 'package:flutter/material.dart';
// import 'package:gluco/core/widgets/custom_button.dart';
// import 'package:gluco/features/home/presentation/view/widgets/field_ma.dart';

// class PartScreenPressure extends StatefulWidget {
//   String? Text1;
//   String? Text2;
//   String? Text3;
//   String? Text4;
//   String? Text5;
//   String? Text6;
//   String text7;
//   String text8;
//   String text9;
//   PartScreenPressure(
//       this.Text2, this.Text4, this.Text6, this.text7, this.text8, this.text9);

//   @override
//   State<PartScreenPressure> createState() => _PartScreenState();
// }

// class _PartScreenState extends State<PartScreenPressure> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(shrinkWrap: true, children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 24),
//         child: Column(
//           children: [
//             CustomTextFieldMa(widget.Text2, widget.text7),
//             const SizedBox(height: 16,),
//             CustomTextFieldMa(widget.Text4, widget.text8),
//             const SizedBox(height: 16,),
//             CustomTextFieldMa(widget.Text6, widget.text9),
//           ],
//         ),
//       ),
//       const SizedBox(height: 16,),
//       Column(
//         children: [
//           CustomButton(
//             text: 'حفظ',
//             circular: 10,
//             color: Colors.black,
//             textcolor: Colors.white,
//           ),
//         ],
//       ),
//     ]);
//   }
// }
