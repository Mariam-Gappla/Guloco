import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/activities/data/pressurecheck.dart';
import 'package:gluco/features/activities/presentation/manager/pressure_cubit/presssure_check_states.dart';

class PresssureCheckCubit extends Cubit<PresssureCheckStates>{
  PresssureCheckCubit() : super(PresssureCheckinitial());

  Future<void> fetchpressuredata(String date)async
  {
    emit(PresssureCheckloading());
    List<Pressurecheck> pressurdata=[];
    List<int> heart=[];
    List<int> diastolic_pressur=[];
    List<int> systolic_pressure=[];

    var respons= await DioHelper().fetchData(
      url: 'http://nouraapi.runasp.net/api/Selecting_data/user\'s presure_data?specificDate=$date', 
      token: userToken!,
      );
      var data=respons.data;
      print(data);
      if(respons.statusCode==200 && data!=null)
      {
        for(int i=0;i<data.length;i++)
        {
          pressurdata.add(Pressurecheck.fromJson(data[i]));
        }
      }
      if(pressurdata.isNotEmpty){
        for(int i=0;i<pressurdata.length;i++)
        {
          heart.add(pressurdata[i].heartrate!);
          diastolic_pressur.add(pressurdata[i].diastolicpressure!);
          systolic_pressure.add(pressurdata[i].systolicpressure!);
        }
        print('token in pressure cubit $userToken');
        emit(haveData(diastolic_pressur,systolic_pressure,heart,pressurdata));
      }
      else
      {
        emit(nothaveData());
      }
  }
  


}

