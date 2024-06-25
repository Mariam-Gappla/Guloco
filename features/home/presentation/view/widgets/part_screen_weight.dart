
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/helper/api.dart';
import 'package:gluco/core/widgets/custom_button.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/home/presentation/manager/sport_cubit/sport_cubit.dart';
import 'package:gluco/features/home/presentation/manager/sport_cubit/sport_state.dart';
import 'package:gluco/features/home/presentation/view/widgets/TextFieldNumber.dart';
import 'package:gluco/features/home/presentation/view/widgets/drop_down_activity.dart';
import 'package:gluco/features/home/presentation/view/widgets/field_ma.dart';

class PartScreenWeight extends StatelessWidget {
  String? Text1;
  String? Text2;
  String Text3;
  String? selectedActivity;
  var weight= TextEditingController();
  PartScreenWeight(this.Text2, this.Text3);
  TextEditingController? controller;
void _onActivityChanged(String? value) {
    
      selectedActivity = value;

  }
GlobalKey<FormState> valid=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SportCubit(),
      child: BlocConsumer<SportCubit,SportState>(
        builder: (context, state){
          return ListView(shrinkWrap: true, children: [
      Form(
        key: valid,
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Textfieldnumber(Text2, Text3, weight),
              const SizedBox(height: 16,),
              DropdownActivity(onChanged: _onActivityChanged,),
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
            onTap: () {
              if(valid.currentState!.validate())
              {
                BlocProvider.of<SportCubit>(context).sport(
                  weight.text.toString(), 
                  selectedActivity!
                  );
                  print(state);
            }
            }
          ),
        ],
      ),
    ]);

        },
        listener: (context, state) {
          if(state is Sportsuccess)
          {
            
           showToast(msg: "added", state: ToastStates.SUCCESS);
          }
          else if(state is Sporterror)
          {
            showToast(msg: state.errormessage, state: ToastStates.ERROR);
          }
          else{
            const Center(child: CircularProgressIndicator());
          }
          
        },
        ),
      );
  }
}
