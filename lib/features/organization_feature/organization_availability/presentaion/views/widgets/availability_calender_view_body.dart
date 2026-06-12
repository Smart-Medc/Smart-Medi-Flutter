import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'availability_tips_widget.dart';
import 'calendar_widget.dart';
import 'weekly_schedule_widget.dart';

class AvailabilityCalenderViewBody extends StatelessWidget {
  const AvailabilityCalenderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarBackButton(),
          SizedBox(height: 20.h),
          const AppHeader(
            title: 'Availability Calendar',
            subtitle: 'Set your working hours and available time slots',
          ),
          SizedBox(height: 24.h),
          
          // Calendar Widget
          const CalendarWidget(),
          SizedBox(height: 16.h),
          
          // Weekly Schedule Widget
          const WeeklyScheduleWidget(),
          SizedBox(height: 16.h),
          
          // Availability Tips Widget
          const AvailabilityTipsWidget(),
          SizedBox(height: 24.h),
          
          // Save Button
          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              child: Text('Save Changes', style: AppStyles.textStyle15W600White),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

