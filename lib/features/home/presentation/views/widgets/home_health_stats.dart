import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class HomeHealthStats extends StatelessWidget {
  const HomeHealthStats({super.key});

  @override
  Widget build(BuildContext context) {
    const double medicationAdherence = 94;
    const double storageUsed = 5.2;
    const double totalStorage = 10;
    return CardContainer(
      padding: EdgeInsets.all(18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.trending_up,
                color: AppColors.iconGreen,
                size: 24.sp,
              ),
              8.horizontalSpace,
              Text(
                'Health Stats',
                style: AppStyles.textStyle15W600Black,
              ),
            ],
          ),
          18.verticalSpace,
          _buildStatItem(
            label: 'Medication Adherence',
            value: '${medicationAdherence.toStringAsFixed(0)}%',
            progress: medicationAdherence / 100,
            color: AppColors.iconGreen,
          ),
          20.verticalSpace,
          _buildStatItem(
            label: 'Storage Used',
            value: '${storageUsed.toStringAsFixed(1)} GB / ${totalStorage.toStringAsFixed(0)} GB',
            progress: storageUsed / totalStorage,
            color: AppColors.iconBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String label,
    required String value,
    required double progress,
    required Color color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppStyles.textStyle10W400DarkGrey,
            ),
            Text(
              value,
              style: AppStyles.textStyle12W500Black,
            ),
          ],
        ),
        5.verticalSpace,
        LinearProgressIndicator(
          value: progress,
          backgroundColor: AppColors.greyBackgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(color),
          borderRadius: BorderRadius.circular(999.r),
          minHeight: 6.h,
        ),
      ],
    );
  }
}

