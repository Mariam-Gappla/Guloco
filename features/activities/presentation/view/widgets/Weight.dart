
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/activities/presentation/manager/weight_cubit/weight_check_cubit.dart';
import 'package:gluco/features/activities/presentation/manager/weight_cubit/weight_check_states.dart';
import 'package:gluco/features/activities/presentation/view/widgets/WeightCalender.dart';
import 'package:gluco/features/activities/presentation/view/widgets/WeightChart.dart';
import 'package:gluco/features/activities/presentation/view/widgets/chartempty.dart';

class Weight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 20, left: 15),
      child: ListView(
        children: [
           Weightcalender(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text("بعد النشاط"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 50)),
                  Text("قبل النشاط"),
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 5,
                    ),
                  ),
                ],
              ),
              BlocConsumer<WeightCheckCubit,WeightCheckStates>(
                builder:(context,state){
                  if(state is WeightCheckloading)
                  {
                    return const Center(child: CircularProgressIndicator(),);
                  }
                  else if(state is haveData)
                  {
                    List<FlSpot> spots = state.weight.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value.toDouble();
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      print(spots);
                    return Column(
                        children: [
                          SizedBox(
                             width: double.infinity,
                            height: 300,
                            child: Weightchart(spots)
                            ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                              "تفاصيل اخرى",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                             ),
                              ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:state.weightdata.length ,
                            itemBuilder:(context,index){
                              return Padding(
                                padding: const EdgeInsets.only(top:10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                   borderRadius: BorderRadius.circular(10)
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child:Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text("الوزن"),
                                          Text(state.weightdata[index].weight.toString()),
                                          const Padding(padding:EdgeInsets.only(right: 50)),
                                          const Text("الرياضه:"),
                                          Text(state.weightdata[index].sport.toString()),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("الوقت:"),
                                          Text(state.weightdata[index].time!.minute.toString()),
                                          const Text(":"),
                                          Text(state.weightdata[index].time!.hour.toString()),
                                
                                        ],
                                      ),
                                      
                                    ],
                                  ) ,
                                ),
                              );
                            }
                            )
                            ],)
                        ],);
                  }
                  else{
                    return SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Chartempty()
                        );
                  }
                }, 
                listener: (context,state){}),
              
            ],
          )
        ],
      ),
    );
  }
}
