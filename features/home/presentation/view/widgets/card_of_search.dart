import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CardOfSearch extends StatelessWidget {
  const CardOfSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Iconsax.search_normal_copy),
            Text(
              'بحث',
              style: TextStyle(fontSize: 22),
            ),
            Icon(Iconsax.square_copy),
          ],
        ),
      ),
    );
  }
}
