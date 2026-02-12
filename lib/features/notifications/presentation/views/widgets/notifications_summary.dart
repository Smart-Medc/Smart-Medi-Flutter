import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/summary_item.dart';

class NotificationsSummary extends StatelessWidget {
  const  NotificationsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: AppStyles.textStyle24W600Black,
        ),
        12.verticalSpace,
        CardContainer(
          padding: EdgeInsets.only(left: 35.w, right: 60.w, top: 23.h, bottom: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryItem.line(
                    title: 'Unread',
                    value: '2',
                  ),
                  20.verticalSpace,
                  SummaryItem.line(
                    title: 'This Week',
                    value: '1',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryItem.line(
                    title: 'Today',
                    value: '4',
                  ),
                  20.verticalSpace,
                  SummaryItem.line(
                    title: 'Total',
                    value: '0',
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
