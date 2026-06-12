import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/organization_availability/presentaion/views/widgets/day_slot.dart';

class WeeklyScheduleWidget extends StatefulWidget {
  const WeeklyScheduleWidget({super.key});

  @override
  State<WeeklyScheduleWidget> createState() => _WeeklyScheduleWidgetState();
}

class _WeeklyScheduleWidgetState extends State<WeeklyScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.greyBackgroundColor),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.access_time,
                color: AppColors.primaryColor,
                size: 20.sp,
              ),
              SizedBox(width: 8.w),
              Text('Weekly Schedule', style: AppStyles.textStyle18W700Black),
            ],
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return const DaySlotWidget(dayName: 'DayName');
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 20);
            },
          ),
        ],
      ),
    );
  }
}
