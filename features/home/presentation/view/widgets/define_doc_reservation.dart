import 'package:flutter/material.dart';
import 'package:gluco/features/home/data/doctor_model/doctor_model.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class DefineInReservation extends StatelessWidget {
  const DefineInReservation({
    super.key,
    required this.showDoc,
  });
  final DoctorModel showDoc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(''),
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                            showDoc.photo.toString(),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: const Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.blue,
                                ),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'د/ ${showDoc.userName} ',
                      style: const TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Iconsax.coin,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'السعر',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${showDoc.detectionPrice} ج',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.account_box_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'الخبره',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${showDoc.doctorspecialization}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Iconsax.location,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'الموقع',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  '${showDoc.address}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
