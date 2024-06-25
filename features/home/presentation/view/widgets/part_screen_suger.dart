import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/home/presentation/manager/suger_cubit/sugar_cubit.dart';
import 'package:gluco/features/home/presentation/manager/suger_cubit/sugar_state.dart';
import 'package:gluco/features/home/presentation/view/widgets/TextFieldNumber.dart';
import 'package:gluco/features/home/presentation/view/widgets/field+drop_down.dart';
import 'package:gluco/features/home/presentation/view/widgets/field_ma.dart';

class PartScreenSuger extends StatelessWidget {
  String? Text1;
  String? Text2;
  String Text3;
  String? meal;
  GlobalKey<FormState> valid=new GlobalKey();
  var sugarlevel=TextEditingController();
  PartScreenSuger(this.Text2, this.Text3);
  void onmeal(String? mealname)
  {
    meal=mealname;

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SugarCubit(),
      child: BlocConsumer<SugarCubit,sugarstate>(
        listener:(context,state){
          if(state is sugarsuccess)
          {
            showToast(msg: "added", state: ToastStates.SUCCESS);
          }
          else if(state is sugarerror)
          {
            
            showToast(msg: state.errormessage, state: ToastStates.ERROR);
          }
          else{
            const Center(child: CircularProgressIndicator());
          }

        },
        builder:(context,state) {
          return ListView(
      shrinkWrap: true, 
      children: [
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Form(
          key: valid,
          child: Column(
            children: [
              Textfieldnumber(Text2, Text3, sugarlevel),
              const SizedBox(height: 16,),
              CustomTextFieldDropdown(mealname: onmeal)
            ],
          ),
        ),
      ),
      const SizedBox(height: 24,),
      Column(
        children: [
          CustomButton(
            text: 'حفظ',
            circular: 10,
            color: Colors.black,
            textcolor: Colors.white,
            onTap: (){
              if(valid.currentState!.validate())
              {
                BlocProvider.of<SugarCubit>(context).sugar(
                  sugarlevel.text, 
                  meal!);
              print(state);
              }
            },
          ),
          const SizedBox(height: 16,),
         ],
      ),
    ]);
        },
    )
    );

  }
}
