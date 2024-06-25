import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:gluco/features/home/presentation/manager/dooctor_cubit/doctor_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorDetails.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is DoctorssLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DoctorsSuccessState || state is DoctorFilteredState) {
          List<DoctorModel> doctors;
          if (state is DoctorsSuccessState) {
            doctors = state.doctorModels;
          } else if (state is DoctorFilteredState) {
            doctors = state.filteredDoctors;
          } else {
            doctors = [];
          }

          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: DoctorDetials(
                  doctorId: doctors[index].id!.toInt(),
                  docDetails: doctors[index],
                ),
              );
            },
            itemCount: doctors.length,
          );
        } else if (state is DoctorsErrorState) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
