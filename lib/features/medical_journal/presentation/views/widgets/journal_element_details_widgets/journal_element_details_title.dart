import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// Widget that displays the journal entry title with date and time
class JournalElementDetailsTitle extends StatelessWidget {
  const JournalElementDetailsTitle({
    super.key,
    required this.title,
    required this.date,
    required this.time,
  });

  final String title;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle24W600Black,
        ),
        Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 14.sp,
              color: AppColors.textDarkGrey,
            ),
            6.horizontalSpace,
            Text(
              '$date  •  $time',
              style: AppStyles.textStyle14W400DarkGrey,
            ),
          ],
        ),
      ],
    );
  }
}

