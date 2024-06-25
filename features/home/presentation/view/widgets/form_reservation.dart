import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorReservation.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';

class formReservation extends StatelessWidget {
  const formReservation({super.key, required this.showDoc, required this.doctorId});
  final DoctorModel showDoc;
  final int doctorId;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var nameController = TextEditingController();
    var sexController = TextEditingController();
    var ageController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                hint: 'أدخل اسمك',
                controller: nameController,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextField(
                          hint: 'الجنس',
                          controller: sexController,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextField(
                          hint: 'أدخل عمرك',
                          controller: ageController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextField(
                hint: 'أدخل رقم تلفونك',
                controller: phoneController,
              ),
              const SizedBox(
                height: 32,
              ),
              state is ReservationLoaded
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButtonHome(
                      text: 'التالي',
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorReservation(
                                showDoc: showDoc,
                                username: nameController.text,
                                phone: phoneController.text,
                                age: ageController.text,
                                sex: sexController.text,
                                doctorId: doctorId,
                              ),
                            ),
                          );
                        }
                      },
                      borderRadius: 4,
                    ),
            ],
          ),
        );
      },
    );
  }
}
