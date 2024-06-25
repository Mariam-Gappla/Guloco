import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/helper/serverfailure.dart';
import 'package:dio/dio.dart';
import 'package:gluco/core/widgets/network.dart';
import 'package:gluco/features/home/presentation/manager/suger_cubit/sugar_state.dart';
class SugarCubit extends Cubit<sugarstate>{
  SugarCubit() : super(sugarsuccess());
  void sugar (
    String sugarlevel,
    String mealname
  )async{
    emit(sugarloading());
   try{
    var data=await DioHelper().addData(
      url: 'http://nouraapi.runasp.net/api/Measurements/blood sugar level', 
      body: {
         "sugar_reading": sugarlevel,
        "measurement_date": mealname
      }, 
      Contenttype:'application/json', 
      token:userToken!);
    if(data.statusCode==200)
    {
      emit(sugarsuccess());
    }
    else if(data.statusCode==500)
    {
      emit(sugarerror("internal server error, please try again"));
    }
    
   }
   catch(e)
   {
    if(e is DioException)
        {
          emit(sugarerror(ServerFailure.fromDioError(e).errorMessage));

        }
        else{
          emit(sugarerror(e.toString()));
        }

   }
  
  

  }


}