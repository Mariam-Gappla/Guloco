// import 'package:flutter/material.dart';
// import 'package:gluco/core/widgets/custom_button.dart';
// import 'package:gluco/features/home/presentation/view/widgets/field+drop_down.dart';
// import 'package:gluco/features/home/presentation/view/widgets/field_ma.dart';

// class PartScreenSuger extends StatefulWidget {
//   String? Text1;
//   String? Text2;
//   String Text3;
//   PartScreenSuger(this.Text2, this.Text3);

//   @override
//   State<PartScreenSuger> createState() => _PartScreenState();
// }

// class _PartScreenState extends State<PartScreenSuger> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(shrinkWrap: true, children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 24),
//         child: Column(
//           children: [
//             CustomTextFieldMa(widget.Text2, widget.Text3),
//             const SizedBox(height: 16,),
//             CustomTextFieldDropdown()
//           ],
//         ),
//       ),
//       const SizedBox(height: 24,),
//       Column(
//         children: [
//           CustomButton(
//             text: 'حفظ',
//             circular: 10,
//             color: Colors.black,
//             textcolor: Colors.white,
//           ),
//           const SizedBox(height: 16,),
//           const Text("أو"),
//           const SizedBox(height: 16,),
//           CustomButton(
//             text: 'بلوتوث',
//             circular: 10,
//             color: Colors.black,
//             textcolor: Colors.white,
//           ),
//          ],
//       ),
//     ]);
//   }
// }
