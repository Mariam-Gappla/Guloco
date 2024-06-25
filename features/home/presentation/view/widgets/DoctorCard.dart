import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doc});
  final DoctorModel doc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        // width: MediaQuery.of(context).size.width*0.3,
        // height: MediaQuery.of(context).size.width*0.4,
        child: Card(
          
          // color: Colors.blue,
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width*0.3,
                child: Image.network(
                  doc.photo.toString(),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(doc.userName.toString(),
                    style: const TextStyle(
                      
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              Text(doc.doctorspecialization.toString(),
                  style: const TextStyle(fontSize: 14)),
              Text(doc.address.toString(),
                  style: const TextStyle(fontSize: 14)),
              Text(doc.appointment.toString(),
                  style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}
