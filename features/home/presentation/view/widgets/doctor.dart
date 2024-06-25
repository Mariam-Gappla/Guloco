import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/home/presentation/manager/dooctor_cubit/doctor_cubit.dart';
import 'package:gluco/features/home/presentation/view/widgets/BarApp.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorCard.dart';
import 'package:gluco/features/home/presentation/view/widgets/DoctorList.dart';
import 'package:gluco/features/home/presentation/view/widgets/custom_text_field_center_text.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class Doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: BarApp(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTextFieldCenterlable(
                  onChange: (input) {
                    DoctorCubit.get(context).filterProducts(input: input);
                  },
                  hint: 'بحث',
                  fillColor: Colors.white,
                  prefixIcon: FontAwesomeIcons.bars,
                  suffixIcon: Iconsax.search_normal_copy,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  "المفضله",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              BlocConsumer<DoctorCubit, DoctorState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.24,
                      child:State is DoctorssLoadingState ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: DoctorCubit.get(context).doctorModels.length,
                        itemBuilder: (context, index) {
                          return DoctorCard(
                              doc:
                                  DoctorCubit.get(context).doctorModels[index]);
                        },
                      ),
                    ),
                  );
                },
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              const SliverToBoxAdapter(
                child: Text(
                  "الاكثر شهره",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    fontSize: 18,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: DoctorList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
