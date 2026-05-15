import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/organization_availability/presentaion/views/widgets/availability_tips_widget.dart';
import 'package:smart_medi/features/organization_feature/organization_availability/presentaion/views/widgets/calendar_widget.dart';
import 'package:smart_medi/features/organization_feature/organization_availability/presentaion/views/widgets/day_slot.dart';
import 'package:smart_medi/features/organization_feature/organization_availability/presentaion/views/widgets/weekly_schedule_widget.dart';


class AvailabilityCalenderView extends StatelessWidget {
  const AvailabilityCalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back, color: AppColors.textBlack),
              ),
              SizedBox(width: 8.w),
              // Header
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Availability Calendar', style: AppStyles.textStyle24W700Black),
                      Text(
                        'Set your working hours and available time slots',
                        style: AppStyles.textStyle14W400DarkGrey,
                      ),
                    ],
                  ),
                ],
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
            ],
          ),
        ),
      ),
    );
  }
}