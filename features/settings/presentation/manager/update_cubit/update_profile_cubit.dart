import 'package:bloc/bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/settings/data/update_profile.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

  void updateUserData(
      {required String name,
      required String address,
      required DateTime date,
      required String phone}) {
    emit(UpdateUserLoaded());
    DioHelper().putData(url: UPDATE_PROFILE, token: 'Bearer $userToken', data: {
      'username': name,
      'address': address,
      'date': date,
      'phone': phone,
    }).then((value) async {
      final updateUser = UpdateProfile.fromJson(value.data);
      print(' update status is ${updateUser.message}');
      print(updateUser.message);
      // await getUserData();
      emit(UpdateUserSuccess());
    }).catchError((onError) {
      emit(UpdateUserFailure('Server error: ${onError.response?.statusCode}'));
    });
  }
}
