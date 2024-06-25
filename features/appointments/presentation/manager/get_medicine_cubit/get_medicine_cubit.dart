// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gluco/core/helper/api.dart';
// import 'package:gluco/core/widgets/network.dart';
// import 'package:gluco/features/appointments/data/get_medicine_model/get_medicine_model.dart';
// import 'package:meta/meta.dart';

// part 'get_medicine_state.dart';

// class GetMedicineCubit extends Cubit<GetMedicineState> {
//   GetMedicineCubit() : super(GetMedicineInitial());

//   static GetMedicineCubit get(context) => BlocProvider.of(context);
//   List<GetMedicineModel> medicine = [];

//   void getMedicines() {
//     emit(GetMedicineLoaded());
//     DioHelper().getData(url: GET_MEDICINES, token: 'Bearer $userToken').then((value) {
//       print('Response data: ${value.data}');
//       medicine = (value.data as List)
//           .map((medicine) => GetMedicineModel.fromJson(medicine))
//           .toList();
//       emit(GetMedicineSuccess(medicine: medicine));
//     }).catchError((onError) {
//       emit(GetMedicineFailure(errMsg: onError.toString()));
//       print('Error: ${onError.toString()}');
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/appointments/data/get_medicine_model/get_medicine_model.dart';
import 'package:meta/meta.dart';

part 'get_medicine_state.dart';

class GetMedicineCubit extends Cubit<GetMedicineState> {
  GetMedicineCubit() : super(GetMedicineInitial());

  static GetMedicineCubit get(context) => BlocProvider.of(context);
  List<GetMedicineModel> medicine = [];

  void getMedicines() {
    emit(GetMedicineLoaded());
    DioHelper()
        .getData(url: GET_MEDICINES, token: 'Bearer $userToken')
        .then((value) {
      medicine = (value.data as List)
          .map((medicine) => GetMedicineModel.fromJson(medicine))
          .toList();
      emit(GetMedicineSuccess(medicine: medicine));
    }).catchError((onError) {
      emit(GetMedicineFailure(errMsg: onError.toString()));
    });
  }
}
