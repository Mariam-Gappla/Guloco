import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class MyCalenderTwo extends StatelessWidget {
  const MyCalenderTwo({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _localeExample(),
        ],
      ),
    );
  }

  EasyDateTimeLine _localeExample() {
    return EasyDateTimeLine(
      
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        //`selectedDate` the new date selected.
      },
      activeColor: const Color(0xffB04759),
      locale: "ar",
    );
  }
}

class EasyInfiniteDateTimeLineExample extends StatefulWidget {
  const EasyInfiniteDateTimeLineExample({super.key});

  @override
  State<EasyInfiniteDateTimeLineExample> createState() =>
      _EasyInfiniteDateTimeLineExampleState();
}

class _EasyInfiniteDateTimeLineExampleState
    extends State<EasyInfiniteDateTimeLineExample> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  DateTime? _focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          controller: _controller,
          firstDate: DateTime(2023),
          focusDate: _focusDate,
          lastDate: DateTime(2023, 12, 31),
          onDateChange: (selectedDate) {
            setState(() {
              _focusDate = selectedDate;
            });
          },
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.animateToFocusDate();
              },
              child: const Text('Animate To Focus Date'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToCurrentData();
              },
              child: const Text('Animate To Current Date'),
            ),
            ElevatedButton(
              onPressed: () {
                _controller.animateToDate(DateTime(2023, 6, 5));
              },
              child: const Text('Animate To 2023-6-5 '),
            ),
          ],
        ),
      ],
    );
  }
}
