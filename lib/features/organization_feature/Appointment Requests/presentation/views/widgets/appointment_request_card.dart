import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/data/models/appointment_request_model.dart';

class AppointmentRequestCard extends StatelessWidget {
  const AppointmentRequestCard({
    super.key,
    required this.request,
  });

  final AppointmentRequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 34.w,
                width: 34.w,
                decoration: BoxDecoration(
                  color: AppColors.iconBGBlue,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.iconBlue,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.w,
                      runSpacing: 6.h,
                      children: [
                        Text(
                          request.patientName,
                          style: AppStyles.textStyle15W600Black,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                          decoration: BoxDecoration(
                            color: AppColors.iconCyan,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Text(
                            request.status,
                            style: AppStyles.textStyle10W400White,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 6.h,
                      children: [
                        _AppointmentMetaItem(
                          icon: Icons.calendar_today_outlined,
                          label: request.date,
                        ),
                        _AppointmentMetaItem(
                          icon: Icons.access_time_rounded,
                          label: request.time,
                        ),
                        _AppointmentMetaItem(
                          icon: Icons.description_outlined,
                          label: request.recordsShared,
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Reason: ',
                            style: AppStyles.textStyle10W500DarkGrey,
                          ),
                          TextSpan(
                            text: request.reason,
                            style: AppStyles.textStyle10W400DarkGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      request.requestedAgo,
                      style: AppStyles.textStyle10W400LightGrey,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              Expanded(
                child: _AppointmentActionButton(
                  title: 'Reject',
                  icon: Icons.cancel_outlined,
                  backgroundColor: AppColors.greyBackgroundColor,
                  textColor: AppColors.textBlack,
                  iconColor: AppColors.textBlack,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 2,
                child: _AppointmentActionButton(
                  title: 'Accept',
                  icon: Icons.check_circle_outline_rounded,
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.textWhite,
                  iconColor: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppointmentMetaItem extends StatelessWidget {
  const _AppointmentMetaItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 12.sp,
          color: AppColors.textLightGrey,
        ),
        SizedBox(width: 4.w),
        Text(
          label,
          style: AppStyles.textStyle10W400DarkGrey,
        ),
      ],
    );
  }
}

class _AppointmentActionButton extends StatelessWidget {
  const _AppointmentActionButton({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
  });

  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16.sp, color: iconColor),
          SizedBox(width: 6.w),
          Text(
            title,
            style: (textColor == AppColors.textWhite)
                ? AppStyles.textStyle12W500White
                : AppStyles.textStyle12W500Black,
          ),
        ],
      ),
    );
  }
}
