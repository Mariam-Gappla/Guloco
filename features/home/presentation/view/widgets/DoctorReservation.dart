import 'package:flutter/material.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/view/widgets/Comments.dart';
import 'package:gluco/features/home/presentation/view/widgets/about_doctor.dart';
import 'package:gluco/features/home/presentation/view/widgets/bar_app_one_doc.dart';
import 'package:gluco/features/home/presentation/view/widgets/cusrom_button.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_icon.dart';
import 'package:gluco/features/home/presentation/view/widgets/define_doc_reservation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/home/presentation/manager/reservation_cubit/reservation_cubit.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DoctorReservation extends StatelessWidget {
  const DoctorReservation({
    super.key,
    required this.showDoc,
    required this.username,
    required this.sex,
    required this.age,
    required this.phone,
    required this.doctorId,
  });
  final DoctorModel showDoc;
  final String username;
  final String sex;
  final String age;
  final String phone;
  final int doctorId;

  @override
  Widget build(BuildContext context) {
    // final List<String> times = [
    //   "8:00م",
    //   "9:00م",
    //   "10:00م",
    //   "11:00م",
    //   "12:00ص",
    //   "1:00ص",
    //   "11:00م",
    //   "12:00ص",
    // ];

    TextEditingController dateController = TextEditingController();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        dateController.text = "${picked.toLocal()}".split(' ')[0];
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: BarAppOneDoc(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.blue,
                            width: 1.0,
                          ),
                        ),
                        child: DefineInReservation(showDoc: showDoc),
                      ),
                      // AboutDoctor(
                      //   docs: showDoc,
                      // ),
                      const SizedBox(
                        height: 24,
                      ),
                      const Text(
                        "الايام",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // const MyCalenderTwo(),
                      const SizedBox(
                        height: 16,
                      ),
                      // const Text(
                      //   "الوقت",
                      //   style: TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.bold),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 20),
                      //   child: Wrap(
                      //     spacing: 8.0,
                      //     runSpacing: 12.0,
                      //     children: times.map((time) => Time(time)).toList(),
                      //   ),
                      // ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: dateController,
                            decoration: const InputDecoration(
                              hintText: 'أدخل التاريخ',
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: BlocConsumer<ReservationCubit,
                                  ReservationState>(
                                listener: (context, state) {
                                  if (state is ReservationSuccess) {
                                    showToast(
                                        msg: 'Reservation Success',
                                        state: ToastStates.SUCCESS);
                                  } else if (state is ReservationFailure) {
                                    showToast(
                                        msg: 'Reservation Failed',
                                        state: ToastStates.ERROR);
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ReservationLoaded) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  return CustomButtonHome(
                                    text: 'تأكيد    ',
                                    color: Colors.blue,
                                    textColor: Colors.white,
                                    onPressed: () {
                                      if (dateController.text.isNotEmpty) {
                                        // تحويل النص إلى عدد صحيح بعد تحويل الأرقام الهندية إلى الأرقام العربية
                                        final String arabicDigits = age
                                            .replaceAllMapped(
                                                RegExp(r'[٠١٢٣٤٥٦٧٨٩]'),
                                                (match) {
                                          final String digit = match.group(0)!;
                                          return String.fromCharCode(
                                              digit.codeUnitAt(0) -
                                                  0x0660 +
                                                  0x0030);
                                        });
                                        int ageInt = int.parse(arabicDigits);

                                        ReservationCubit.get(context)
                                            .userReservation(
                                          username: username,
                                          phone: phone,
                                          age: ageInt,
                                          sex: sex,
                                          date: dateController.text,
                                          docId: doctorId,
                                        );
                                      }
                                    },
                                    borderRadius: 4,
                                  );
                                },
                              ),
                            ),
                            const CustomIcon(
                              icon: Iconsax.message,
                              color: Colors.blue,
                              colorIcon: Colors.white,
                              circular: 30,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text("  التعليقات"),
                          const Spacer(),
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add,color: Colors.blue)),
                          const Text("اضافه تعليق",style: TextStyle(color: Colors.blue),),
                        ],
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => const Comments(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
