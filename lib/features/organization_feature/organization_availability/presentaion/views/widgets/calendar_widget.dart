import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int selectedDay = 16;

  final List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, color: AppColors.primaryColor, size: 20.sp),
              SizedBox(width: 8.w),
              Text('Calendar', style: AppStyles.textStyle18W700Black),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_left, color: AppColors.primaryColor),
              ),
              Text('December 2025', style: AppStyles.textStyle18W700Black.copyWith(fontSize: 16.sp)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.chevron_right, color: AppColors.primaryColor),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: weekDays
                .map((day) => Text(day, style: AppStyles.textStyle10W400DarkGrey))
                .toList(),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 4.w,
            runSpacing: 4.h,
            children: List.generate(31, (index) {
              final day = index + 1;
              final isSelected = day == selectedDay;
              return GestureDetector(
                onTap: () => setState(() => selectedDay = day),
                child: Container(
                  width: 32.w,
                  height: 32.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryColor : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      color: isSelected ? AppColors.textWhite : AppColors.textBlack,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}