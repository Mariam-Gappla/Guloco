import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_cubit.dart';
import 'package:gluco/features/home/presentation/manager/pressure_cubit/pressure_state.dart';
import 'package:gluco/features/home/presentation/view/widgets/TextFieldNumber.dart';

class PartScreenPressure extends StatelessWidget {
  
  var contraction=TextEditingController();

   var extraversion=TextEditingController();

   var heart= TextEditingController();
   String? Text1;
   String? Text2;
   String? Text3;
   String? Text4;
   String? Text5;
   String? Text6;


  PartScreenPressure(this.Text1,this.Text2,this.Text3,this.Text4,this.Text5,this.Text6);

  GlobalKey<FormState> valid=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PressureCubit()),
        BlocProvider(create: (context) => SugarCheckCubit()), // Ensure SugarCheckCubit is provided
      ] ,
      child: BlocConsumer<PressureCubit,PressureState>(
        listener: (context, state){
          if(state is Pressuresuccess)
          {
            
           showToast(msg: "added", state: ToastStates.SUCCESS);
          }
          else if(state is Pressureserror)
          {
            showToast(msg:state.errormessage, state: ToastStates.ERROR);
          }
          else{
             const Center(child: CircularProgressIndicator(),);
          }
        },
        builder: (context, state){
          return ListView(
          shrinkWrap: true, 
          children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Form(
                  key: valid,
                  child: Column(
                  children: [
                    Textfieldnumber(Text1, Text4, contraction),
                    const SizedBox(height: 16,),
                    Textfieldnumber(Text2, Text5, extraversion),
                    const SizedBox(height: 16,),
                    Textfieldnumber(Text3, Text6, heart),
                    const SizedBox(height: 16,),
                    
                  ],
                ),
                  ),
              ),
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: ()async{
                  if(valid.currentState!.validate())
                  {
                    BlocProvider.of<PressureCubit>(context).pressure(
                      contraction.text, 
                      extraversion.text, 
                      heart.text);
                }
                    
          
                },
                child: Column(
                  children: [
                    CustomButton(
                      text: 'حفظ',
                      circular: 10,
                      color: Colors.black,
                      textcolor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
        );
        },
      ),
    );
  }
}
