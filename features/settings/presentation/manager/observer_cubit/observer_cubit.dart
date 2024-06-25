import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/settings/data/add_observer.dart';
import 'package:meta/meta.dart';

part 'observer_state.dart';

class ObserverCubit extends Cubit<ObserverState> {
  ObserverCubit() : super(ObserverInitial());

   static ObserverCubit get(context) => BlocProvider.of(context);

  void userObserver({
    required String email,
    required String phone,
    required String relvant_relation,
  }) {
    emit(ObserverLoaded());
    DioHelper().postData(
      data: {},
      url: Add_Observer,
      query: {
        'email': email,
        'phone': phone,
        'relvant_relation': relvant_relation,
      },
      token: 'Bearer $userToken'
    ).then((value) {
      final addObserver = AddObserver.fromJson(value.data);
      print(addObserver.toString());
      print(addObserver.email);
      emit(ObserverSuccess(addObserver));
    }).catchError((onError) {
      print('Error in Observer cubit: ${onError.toString()}');
      emit(ObserverFailure(onError.toString()));
    });
  }
}
