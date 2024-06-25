import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/activities/data/Weightcheck.dart';
import 'package:gluco/features/activities/presentation/manager/weight_cubit/weight_check_states.dart';

class WeightCheckCubit extends Cubit<WeightCheckStates> {
  WeightCheckCubit() : super(WeightCheckinitial());

  Future<void> fetchweightdata(String date) async {
    List<Weightcheck> weightdata = [];
    List<int> weight = [];

    var respons = await DioHelper().fetchData(
      url:
          'http://nouraapi.runasp.net/api/Selecting_data/user\'s weight_data?specificDate=$date',
      token: userToken!,
    );
    emit(WeightCheckloading());
    var data = respons.data;
    if (respons.statusCode == 200 && data != null) {
      for (int i = 0; i < data.length; i++) {
        weightdata.add(Weightcheck.fromJson(data[i]));
      }
    }
    print(weightdata);
    if (weightdata.isNotEmpty) {
      for (int i = 0; i < weightdata.length; i++) {
        weight.add(weightdata[i].weight!);
      }
      print(weight);
      print('token in weight cubit $userToken');
      emit(haveData(weight, weightdata));
    } else {
      emit(nothaveData());
    }
  }
}
