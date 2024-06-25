
import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key}) : super(key: key);
  static String id = 'PersonalDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل الشخصيه"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const Padding(padding: EdgeInsets.only(top: 24)),
            CircleAvatar(
              radius: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  "assets/DoctorAhmed.png",
                  height: 92,
                  width: 92,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            CustomTextField(
              hint: 'أدخل إسمك',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'أدخل عنوانك',
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'أدخل عمرك',
              fillColor: Colors.white,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'أدخل رقم تلفونك',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CustomButtonHome(text: 'حفظ', color: Colors.blue, textColor: Colors.white, onPressed: () {},borderRadius: 4,),
            ),
          ],
        ),
      ),
    );
  }
}


