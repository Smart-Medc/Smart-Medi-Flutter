import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';


class AppointmentsSummary extends StatelessWidget {
  const AppointmentsSummary({super.key});

  @override
  Widget build(BuildContext context) {

    return SummaryBox(
      items: const[
        SummaryBoxItem.line(
          title: 'Upcoming',
          value: '2',
        ),
        SummaryBoxItem.line(
          title: 'Cancelled',
          value: '1',
        ),
        SummaryBoxItem.line(
          title: 'Completed',
          value: '12',
        ),
        SummaryBoxItem.line(
          title: 'Next Appointment',
          value: 'Mar 25',
        ),
      ],
    );;
  }
}
