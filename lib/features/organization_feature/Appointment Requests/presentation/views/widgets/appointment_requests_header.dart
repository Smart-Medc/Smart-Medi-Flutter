import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AppointmentRequestsHeader extends StatelessWidget {
  const AppointmentRequestsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 44.w,
              width: 44.w,
              decoration: BoxDecoration(
                color: AppColors.textWhite,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Icon(
                Icons.menu_rounded,
                color: AppColors.textBlack,
                size: 28.sp,
              ),
            ),
            Container(
              height: 44.w,
              width: 44.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xff8D6A54), Color(0xff2B201A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                'DR',
                style: AppStyles.textStyle12W500White,
              ),
            ),
          ],
        ),
        SizedBox(height: 22.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Appointment\nRequests',
                    style: AppStyles.textStyle24W700Black,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Review and manage incoming\nappointment requests',
                    style: AppStyles.textStyle12W400DarkGrey,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
                  decoration: BoxDecoration(
                    color: AppColors.textWhite,
                    borderRadius: BorderRadius.circular(14.r),
                    border: Border.all(color: AppColors.formFieldStrokeColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.filter_list_rounded,
                        size: 18.sp,
                        color: AppColors.textBlack,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Filter',
                        style: AppStyles.textStyle12W500Black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 96.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.iconCyan,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '3 Pending',
                    style: AppStyles.textStyle12W500White,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
