import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/core/widgets/custom_text_field.dart';
import 'package:gluco/features/settings/presentation/manager/observer_cubit/observer_cubit.dart';

class AddPerson extends StatelessWidget {
  const AddPerson({super.key});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    var relationController = TextEditingController();
    return BlocProvider(
      create: (context) => ObserverCubit(),
      child: BlocConsumer<ObserverCubit, ObserverState>(
        listener: (context, state) {
          if (state is ObserverSuccess) {
            showToast(msg: 'Added Succesfully', state: ToastStates.SUCCESS);
          } else if(state is ObserverFailure) {
            showToast(msg: 'Failed Succesfully', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            'تخطي',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 16,
                          child: Container(
                            height: 2,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 63,
                    ),
                    const Center(
                      child: Text(
                        'هل تريد احد الاشخاص المقربين ان يتابع معك مستوي السكر و مواعيد الدواء و مستوي الصحه عندك ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 56,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextField(
                        hint: 'ادخل اميل  ',
                        controller: emailController,
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.mail)),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextField(
                        hint: ' رقم التلفون ',
                        controller: phoneController,
                        prefixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.phone)),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomTextField(
                        hint: 'الصفه',
                        controller: relationController,
                        prefixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.type_specimen)),
                      ),
                    ),
                    const SizedBox(
                      height: 213,
                    ),
                    state is ObserverLoaded
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: CustomButton(
                              text: 'اضافه',
                              icon: Icons.add,
                              color: Colors.black,
                              textcolor: Colors.white,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  ObserverCubit.get(context).userObserver(
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      relvant_relation:
                                          relationController.text);
                                }
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
