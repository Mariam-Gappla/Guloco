 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/helper/serverfailure.dart';
import 'package:dio/dio.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/home/presentation/manager/sport_cubit/sport_state.dart';
class SportCubit extends Cubit<SportState> {
  SportCubit() : super(Sportsuccess());
  void sport(
    String weight,
    String sport
  )async
  {
    try{
      var data= await DioHelper().addData(
        url: 'http://nouraapi.runasp.net/api/Measurements/weight', 
        body: {
          "weight": weight,
          "sport": true
        }, 
        Contenttype: 'application/json', 
        token: userToken!);
        if(data.statusCode==201)
        {
          emit(Sportsuccess());
        }
        else if(data.statusCode==500)
        {
          emit(Sporterror("inteernal server error, please try again"));
        }
    }
    on DioException catch(e)
      {
       
          emit(Sporterror(ServerFailure.fromDioError(e).errorMessage));

        
      }
      catch(e)
      {
        emit(Sporterror(e.toString()));
      }

      
    
  }
}