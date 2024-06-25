import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/auth/data/auth.dart';
import 'package:gluco/features/auth/presentation/manager/register/register_state.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister({
    required String username,
    required String email,
    required String password,
    required String confirmpPassword,
    required String phone,
    required File image, 
    required String address,
  }) async {
    emit(RegisterLoaded());
    print("Started userRegister");
    try {
      FormData formData = FormData.fromMap({
        'Username': username,
        'Email': email,
        'Phone': phone,
        'Photo': await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
        'Password': password,
        'confirmpassword': confirmpPassword,
        'Address': address,
      });
      print("FormData prepared"); 
      print("Sending data to server..."); 
      var response = await DioHelper().postData(
        url: REGISTER,
        isMultipart: true,
        data: formData,
      );
      print("Response received: ${response.data}"); 
      final registerModel = Auth.fromJson(response.data);
      print('Registration successful: ${registerModel.message}');
      emit(RegisterSuccess(registerModel: registerModel));
    } catch (onError) {
      print('Error during registration: ${onError.toString()}'); // Debug print
      emit(RegisterFailure(onError.toString()));
    }
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}
