// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/appointments/data/add_medicine_model.dart';
// import 'package:meta/meta.dart';

// part 'add_medicine_state.dart';

// class AddMedicineCubit extends Cubit<AddMedicineState> {
//   AddMedicineCubit() : super(AddMedicineInitial());

//   static AddMedicineCubit get(context) => BlocProvider.of(context);

//   void addMedicine({
//   required String name,
//   required String dosage,
//   required String times,
//   required String date,
// }) {
//   AddMedicineModel? addMedicineModel;
//   emit(AddMedicineLoaded());
//   DioHelper().postData(
//     url: ADD_Medicine,
//     token: 'Bearer $userToken',
//     data: {
//       'name': name,
//       'dosage': dosage,
//       'times': times,
//       'date': date,
//     },
//   ).then((value) {
//     addMedicineModel = AddMedicineModel.fromJson(value.data);
//     emit(AddMedicineSuccess(addMedicineModel!));
//     // تأكد من عدم إغلاق Cubit هنا
//   }).catchError((onError) {
//     print('Error in Add medicine cubit: ${onError.toString()}');
//     emit(AddMedicineFailure(onError.toString()));
//   });
// }

// }


import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/appointments/data/add_medicine_model.dart';
import 'package:meta/meta.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit() : super(AddMedicineInitial());

  static AddMedicineCubit get(context) => BlocProvider.of(context);

  void addMedicine({
    required String name,
    required String dosage,
    required String times,
    required String date,
  }) {
    emit(AddMedicineLoaded());
    DioHelper().postData(
      url: ADD_Medicine,
      token: 'Bearer $userToken',
      data: {
        'name': name,
        'dosage': dosage,
        'times': times,
        'date': date,
      },
    ).then((value) {
      AddMedicineModel addMedicineModel = AddMedicineModel.fromJson(value.data);
      emit(AddMedicineSuccess(addMedicineModel));
    }).catchError((onError) {
      emit(AddMedicineFailure(onError.toString()));
    });
  }
}
