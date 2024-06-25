import 'dart:io'; // مكتبة للتعامل مع الملفات
import 'package:flutter/material.dart'; // مكتبة Flutter الأساسية للتطبيقات
import 'package:flutter_bloc/flutter_bloc.dart'; // مكتبة لإدارة الحالة باستخدام Bloc
import 'package:gluco/core/helper/cach.dart'; // مكتبة مساعدة للتخزين المؤقت
import 'package:gluco/core/widgets/custom_button.dart'; // زر مخصص
import 'package:gluco/core/widgets/custom_show_toast.dart'; // دالة لعرض الرسائل
import 'package:gluco/core/widgets/network.dart'; // مكتبة للشبكة
import 'package:gluco/features/auth/presentation/manager/register/register_cubit.dart'; // Cubit للتسجيل
import 'package:gluco/features/auth/presentation/manager/register/register_state.dart'; // حالات Cubit للتسجيل
import 'package:gluco/features/auth/presentation/view/widget/text_field.dart'; // حقل نص مخصص
import 'package:gluco/features/chat/presentation/manager/fire_auth.dart'; // مكتبة لإدارة المصادقة
import 'package:gluco/features/layout/presentation/view/glocu_layout.dart'; // تخطيط واجهة المستخدم
import 'package:iconsax_flutter/iconsax_flutter.dart'; // مكتبة للأيقونات
import 'package:image_picker/image_picker.dart'; // مكتبة لاختيار الصور

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _file; // متغير لتخزين ملف الصورة

  // دالة لاختيار صورة من المعرض
  Future pickerGallery() async {
    final ImagePicker picker = ImagePicker(); // إنشاء كائن من ImagePicker
    final XFile? myfile = await picker.pickImage(
        source: ImageSource.gallery); // اختيار صورة من المعرض
    setState(() {
      _file = File(myfile!.path); // تخزين مسار الصورة في المتغير _file
    });
  }

  var imageController = TextEditingController(); // متحكم لحقل النص
  var emailController = TextEditingController(); // متحكم لحقل النص
  var passWordController = TextEditingController(); // متحكم لحقل النص
  var nameController = TextEditingController(); // متحكم لحقل النص
  var phoneController = TextEditingController(); // متحكم لحقل النص
  var confirmPassController = TextEditingController(); // متحكم لحقل النص
  var addressController = TextEditingController(); // متحكم لحقل النص

  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(); // مفتاح لنموذج الإدخال

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(), // إنشاء كائن من RegisterCubit
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterSuccess) {
            if (state.registerModel.isAuthenticated == true) {
              print(state.registerModel.isAuthenticated);
              print(state.registerModel.token);
              print('emaaaaaaail issssss${state.registerModel.email}');

              await ChachHelper.saveData(
                      key: 'token', value: state.registerModel.token)
                  .then(
                (value) async {
                  userToken = '${state.registerModel.token}';
                  await FireAuth().createUser(state.registerModel);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GlucoLayout(
                        auth: state.registerModel,
                        imagePath: _file?.path, // تمرير مسار الصورة هنا
                      ),
                    ),
                    (route) => false,
                  );
                  print('Image Path: ${_file?.path}');
                },
              );
              showToast(
                  msg: state.registerModel.message.toString(),
                  state: ToastStates.SUCCESS);
            } else {
              showToast(
                  msg: state.registerModel.message.toString(),
                  state: ToastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text('إنشاء حساب',
                              style: Theme.of(context).textTheme.bodyLarge)),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomField(
                        icon: Icons.person,
                        lable: 'أدخل اسمك',
                        controller: nameController,
                        showBorder: false,
                        onSubmitted: (value) {
                          nameController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل الايميل',
                        controller: emailController,
                        showBorder: false,
                        onSubmitted: (value) {
                          emailController.text = value;
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل رقم الهاتف',
                        controller: phoneController,
                        showBorder: false,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                      ),
                      CustomField(
                        icon: Iconsax.direct,
                        lable: 'أدخل عنوانك',
                        controller: addressController,
                        showBorder: false,
                        onSubmitted: (value) {
                          addressController.text = value;
                        },
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: passWordController,
                        lable: "ادخل الرقم السري",
                        icon: Iconsax.password_check,
                        isPass: true,
                        onSubmitted: (value) {
                          passWordController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomField(
                        showBorder: false,
                        obscure: RegisterCubit.get(context).isObsecure,
                        controller: confirmPassController,
                        lable: "أكد الرقم السري",
                        icon: Iconsax.password_check,
                        isPass: true,
                        onSubmitted: (value) {
                          confirmPassController.text = value;
                        },
                        suffixIcon: RegisterCubit.get(context).suffix,
                        suffixPressed: () {
                          RegisterCubit.get(context).changePasswordVisibility();
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // حاوية لعرض الصورة المختارة من المعرض
                      Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: InkWell(
                          onTap: () {
                            pickerGallery(); // عند الضغط، يتم استدعاء دالة اختيار الصورة من المعرض
                          },
                          child: _file == null
                              ? const Center(
                                  child: Text('من فضلك اختار صورة',
                                      style: TextStyle(
                                          color: Colors
                                              .blue))) // نص افتراضي يظهر عند عدم اختيار صورة
                              : Image.file(
                                  _file!,
                                  fit: BoxFit.cover, // عرض الصورة المختارة
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      if (state is! RegisterLoaded)
                        CustomButton(
                          color: Colors.blue,
                          text: 'تسجيل',
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              // التأكد من صحة النموذج
                              RegisterCubit.get(context).userRegister(
                                username: nameController.text,
                                email: emailController.text,
                                address: addressController.text,
                                password: passWordController.text,
                                confirmpPassword: confirmPassController.text,
                                phone: phoneController.text,
                                image:
                                    _file!, // تمرير الصورة المختارة عند التسجيل
                              );
                            }
                          },
                        ),
                      if (state is RegisterLoaded)
                        const Center(
                          child:
                              CircularProgressIndicator(), // عرض مؤشر التحميل عند تنفيذ التسجيل
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
