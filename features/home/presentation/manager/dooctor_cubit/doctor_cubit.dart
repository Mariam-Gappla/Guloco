import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:meta/meta.dart';

part 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  DoctorCubit() : super(DoctorInitial());
  static DoctorCubit get(context) => BlocProvider.of(context);
  List<DoctorModel> doctorModels = [];

  void getDoctors() {
    emit(DoctorssLoadingState());
    DioHelper().getData(url: HOME_Doctor).then((value) {
      doctorModels = (value.data as List).map((doctor) => DoctorModel.fromJson(doctor)).toList();
      print(doctorModels.toString());
      emit(DoctorsSuccessState(doctorModels: doctorModels));
    }).catchError((onError) {
      emit(DoctorsErrorState(onError.toString()));
      print(onError.toString());
    });
  }

  List<DoctorModel> filteredDoctors = [];

  void filterProducts({required String input}) {
  if (doctorModels.isNotEmpty) {
    filteredDoctors = doctorModels.where((element) => element.userName!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(DoctorFilteredState(filteredDoctors));
  } else {
    emit(DoctorFilteredState([])); // في حال عدم وجود أطباء في القائمة
  }
}

}
