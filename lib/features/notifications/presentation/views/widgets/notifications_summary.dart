import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/summary_box.dart';

class NotificationsSummary extends StatelessWidget {
  const  NotificationsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SummaryBox(
      padding: EdgeInsets.only(left: 35.w, right: 120.w, top: 23.h, bottom: 24.h),
      items: const [
        SummaryBoxItem.line(
          title: 'Unread',
          value: '2',
        ),
        SummaryBoxItem.line(
          title: 'This Week',
          value: '1',
        ),
        SummaryBoxItem.line(
          title: 'Today',
          value: '4',
        ),
        SummaryBoxItem.line(
          title: 'Total',
          value: '0',
        ),
      ],
    );
  }
}
