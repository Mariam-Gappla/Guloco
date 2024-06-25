
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:dio/dio.dart';
import 'package:gluco/core/helper/serverfailure.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_state.dart';

class PressureCubit extends Cubit<PressureState> {
  PressureCubit() : super(Pressuresuccess());
  void pressure(
    String contraction,
    String extraversion,
    String heart
  )async{
      emit(Pressureloading());
      try{
       var data= await DioHelper().addData(
        url: 'http://nouraapi.runasp.net/api/Measurements/blood pressure', 
        body: {
                "diastolic_pressure": contraction,
                "systolic_pressure": extraversion,
                "heart_rate": heart
              }, 
              Contenttype: 'application/json', 
              token: userToken!,
            );
         if(data.statusCode==200)  
         {
          emit(Pressuresuccess());

         }
         else if(data.statusCode==500)
         {
          emit(Pressureserror("internal server error, please try again"));
         }
            
           
      }
        catch(e)
      {
        if(e is DioException)
        {
          emit(Pressureserror(ServerFailure.fromDioError(e).errorMessage));

        }
        else{
          emit(Pressureserror(e.toString()));
        }

      }
       
    
  }
  
}

