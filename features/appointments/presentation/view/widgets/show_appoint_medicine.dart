
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gluco/features/appointments/data/get_medicine_model/get_medicine_model.dart';

class ShowAppointMedicine extends StatelessWidget {
  const ShowAppointMedicine({
    super.key, this.medicineModel,
  });
  final GetMedicineModel? medicineModel;
  @override
  Widget build(BuildContext context) {
    return  Card(
        color: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 25,
                // backgroundImage: AssetImage('assets/images/pose_2.png'),
              ),
              const SizedBox(
                width: 18,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicineModel!.name.toString(),
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(medicineModel!.dosage.toString()),
                ],
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(FontAwesomeIcons.ellipsis),
              ),
            ],
          ),
        ));
  }
}
