import 'package:flutter/material.dart';

class TicksOfHeart extends StatelessWidget {
  const TicksOfHeart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffD9D9D9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'النبص في الدقيقه 68',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/pulse.png',
                  ),
                  Image.asset(
                    'assets/pulse.png',
                  ),
                  Image.asset(
                    'assets/pulse.png',
                  ),
                  Image.asset(
                    'assets/pulse.png',
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 48,
          ),
          Image.asset('assets/heart.png')
        ],
      ),
    );
  }
}
