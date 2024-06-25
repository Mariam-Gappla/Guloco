import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/activities/data/Sugarcheck.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';

class SugarCheckCubit extends Cubit<SugarCheckStates> {
  SugarCheckCubit() : super(SugarCheckinitial());
  double? maxSugarLevel;
  double? minSugarLevel;

  Future<List<Sugarcheck>> fetchsugardata(String date) async {
    // emit(SugarCheckloading());
    List<Sugarcheck> sugardata = [];
    var respons = await DioHelper().fetchData(
      url:
          'http://nouraapi.runasp.net/api/Selecting_data/user\'s sugar_data?specificDate=$date',
      token: userToken!,
    );
    var data = respons.data;
    if (respons.statusCode == 200 && data != null) {
      for (int i = 0; i < data.length; i++) {
        sugardata.add(Sugarcheck.fromJson(data[i]));
      }
    }

    return sugardata;
  }

  Future<void> getsugarlevel(String date) async {
    emit(SugarCheckloading());
    List<Sugarcheck> sugardata = [];
    List<int> sugarlevel = [];
    sugardata = await fetchsugardata(date);
    for (int i = 0; i < sugardata.length; i++) {
      // Use '<' instead of '<='
      sugarlevel.add(sugardata[i].sugar_reading!);
    }
    if (sugardata.isNotEmpty) {
      List<double> sugardataDouble =
          sugarlevel.map((e) => e.toDouble()).toList();
          print('token in suger cubit $userToken');
      emit(haveData(sugardataDouble, sugardata));
    } else {
      emit(nothaveData());
    }
  }
}
