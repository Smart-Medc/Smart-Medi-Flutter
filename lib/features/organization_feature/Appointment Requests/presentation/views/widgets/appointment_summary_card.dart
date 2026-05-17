import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/organization_feature/Appointment%20Requests/data/models/appointment_request_model.dart';

class AppointmentSummaryCard extends StatelessWidget {
  const AppointmentSummaryCard({
    super.key,
    required this.items,
  });

  final List<AppointmentSummaryModel> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
      child: Wrap(
        spacing: 12.w,
        runSpacing: 16.h,
        children: items
            .map(
              (item) => SizedBox(
                width: item.type == AppointmentSummaryType.rejected ? 120.w : 110.w,
                child: _AppointmentSummaryItem(item: item),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _AppointmentSummaryItem extends StatelessWidget {
  const _AppointmentSummaryItem({required this.item});

  final AppointmentSummaryModel item;

  @override
  Widget build(BuildContext context) {
    final SummaryCardColors summaryCardColors = _getColors(item.type);
    final IconData iconData = _getIcon(item.type);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 34.w,
          width: 34.w,
          decoration: BoxDecoration(
            color: summaryCardColors.backgroundColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(
            iconData,
            color: summaryCardColors.iconColor,
            size: 18.sp,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title, style: AppStyles.textStyle10W400LightGrey),
              SizedBox(height: 2.h),
              Text(item.value, style: AppStyles.textStyle18W700Black),
            ],
          ),
        ),
      ],
    );
  }

  SummaryCardColors _getColors(AppointmentSummaryType type) {
    switch (type) {
      case AppointmentSummaryType.pending:
        return const SummaryCardColors(
          backgroundColor: AppColors.iconBGCyan,
          iconColor: AppColors.iconCyan,
        );
      case AppointmentSummaryType.accepted:
        return const SummaryCardColors(
          backgroundColor: AppColors.iconBGGreen,
          iconColor: AppColors.iconGreen,
        );
      case AppointmentSummaryType.rejected:
        return const SummaryCardColors(
          backgroundColor: AppColors.iconBGRed,
          iconColor: AppColors.iconRed,
        );
    }
  }

  IconData _getIcon(AppointmentSummaryType type) {
    switch (type) {
      case AppointmentSummaryType.pending:
        return Icons.access_time_rounded;
      case AppointmentSummaryType.accepted:
        return Icons.check_circle_outline_rounded;
      case AppointmentSummaryType.rejected:
        return Icons.cancel_outlined;
    }
  }
}

class SummaryCardColors {
  final Color backgroundColor;
  final Color iconColor;

  const SummaryCardColors({
    required this.backgroundColor,
    required this.iconColor,
  });
}
