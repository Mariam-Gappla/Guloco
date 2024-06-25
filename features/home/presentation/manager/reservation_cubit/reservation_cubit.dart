import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/home/data/reservation_model/reservation_model.dart';
import 'package:meta/meta.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  ReservationCubit() : super(ReservationInitial());

  static ReservationCubit get(context) => BlocProvider.of(context);

  void userReservation({
    required String username,
    required String phone,
    required int age,
    required String sex,
    required String date,
    required int docId,
  }) {
    emit(ReservationLoaded());

    final requestData = {
      'username': username,
      'phone': phone,
      'age': age,
      'sex': sex,
      'date': date,
    };

    print('Request Data: $requestData');
    final url = 'Doctors/Reservation?id=$docId';
    print('Request URL: $url');

    DioHelper()
        .postData(
      url: url,
      token: 'Bearer $userToken',
      data: requestData,
    )
        .then((value) {
      print('DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDIII ISS $url');
      final reservationModel = ReservationModel.fromJson(value.data);
      emit(ReservationSuccess(reservationModel));
    }).catchError((onError) {
      print('Error in Reservation cubit: ${onError.toString()}');
      emit(ReservationFailure(onError.toString()));
    });
  }
}
