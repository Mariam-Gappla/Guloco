// import 'package:flutter/material.dart';
// import 'package:gluco/core/widgets/custom_button.dart';
// import 'package:gluco/features/home/presentation/view/widgets/drop_down_activity.dart';
// import 'package:gluco/features/home/presentation/view/widgets/field_ma.dart';

// class PartScreenWeight extends StatefulWidget {
//   String? Text1;
//   String? Text2;
//   String Text3;
//   PartScreenWeight(this.Text2, this.Text3);

//   @override
//   State<PartScreenWeight> createState() => _PartScreenState();
// }

// class _PartScreenState extends State<PartScreenWeight> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(shrinkWrap: true, children: [
//       Padding(
//         padding: const EdgeInsets.only(top: 24),
//         child: Column(
//           children: [
//             CustomTextFieldMa(widget.Text2, widget.Text3),
//             const SizedBox(height: 16,),
//             DropdownActivity(),
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
//         ],
//       ),
//     ]);
//   }
// }
