import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/core/widgets/custom_show_toast.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_cubit.dart';
import 'package:gluco/features/activities/presentation/manager/suger_cubit/sugar_check_states.dart';
import 'package:gluco/features/activities/presentation/view/widgets/SugarCalender.dart';
import 'package:gluco/features/activities/presentation/view/widgets/SugarChart.dart';
import 'package:gluco/features/activities/presentation/view/widgets/chartempty.dart';
import 'package:gluco/features/home/presentation/view/widgets/time_line_cal_one.dart';

class AlertFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SugarCheckCubit(),
      child: Padding(
        padding: const EdgeInsets.only(right: 15, top: 20, left: 15),
        child: ListView(
          children: [
           Sugarcalender(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text("بعد الوجبه"),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 5,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(right: 50)),
                    Text("قبل الوجبه"),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: CircleAvatar(
                        backgroundColor: Colors.black87,
                        radius: 5,
                      ),
                    ),
                  ],
                ),
                BlocConsumer<SugarCheckCubit, SugarCheckStates>(
                  listener: (context, state) {
                    if (state is nothaveData) {
                      showToast(
                          msg: 'لا يوجد بيانات', state: ToastStates.ERROR);
                    }
                    if (state is haveData) {
                      showToast(
                          msg: 'تم تحديث البيانات', state: ToastStates.SUCCESS);
                    }
                  },
                  builder: (context, state) {
                    if (state is SugarCheckinitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is haveData) {
                      List<FlSpot> spots =
                          state.sugar.asMap().entries.map((entry) {
                        int index = entry.key;
                        double value = entry.value;
                        return FlSpot(index.toDouble(), value);
                      }).toList();
                      print(spots);
                      return Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Sugarchart(spots)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "تفاصيل اخرى",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.sugardata.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Text("مستوى السكر:"),
                                                Text(state.sugardata[index]
                                                    .sugar_reading
                                                    .toString()),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 50)),
                                                const Text("الوقت:"),
                                                Text(state.sugardata[index]
                                                    .measurement_date
                                                    .toString()),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Text("الحاله:"),
                                                Text(state
                                                    .sugardata[index].status
                                                    .toString()),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 50)),
                                                const Text("الساعه:"),
                                                Text(state.sugardata[index]
                                                    .time!.minute
                                                    .toString()),
                                                const Text(":"),
                                                Text(state
                                                    .sugardata[index].time!.hour
                                                    .toString()),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            ],
                          )
                        ],
                      );
                    } else {
                      return SizedBox(
                          width: double.infinity, 
                          height: 300,
                          child: Chartempty());
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
