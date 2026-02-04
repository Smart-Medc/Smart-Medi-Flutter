import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class MedicationManagementSummary extends StatelessWidget {
  const MedicationManagementSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: AppStyles.textStyle24W600Black),
        12.verticalSpace,
        CardContainer(
          padding: EdgeInsets.only(left: 28.w, right: 60.w, top: 22.h, bottom: 22.h),
          borderColor: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  summaryItem(title: 'Current', value: 2,icon: Icons.medication,iconColor: AppColors.iconBlue, backgroundColor: AppColors.iconBGBlue),
                  20.verticalSpace,
                  summaryItem(title: 'Interactions', value: 1,icon: Icons.warning_amber_rounded,iconColor: AppColors.iconRed, backgroundColor: AppColors.iconBGRed),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  summaryItem(title: 'Adherence', value: 92,icon: Icons.compare_arrows,iconColor: AppColors.iconGreen, backgroundColor: AppColors.iconBGGreen),
                  20.verticalSpace,
                  summaryItem(title: 'Next Dose', value: 2,icon: Icons.schedule,iconColor: AppColors.iconBlue, backgroundColor: AppColors.iconBGBlue),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget summaryItem({required String title, required int value,required IconData icon, required Color backgroundColor, required Color iconColor}) {
    return Row(
      children: [
        IconWithBackground(icon: icon, backgroundColor: backgroundColor, iconColor: iconColor),
        8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.textStyle10W400LightGrey,
            ),
            Text(
              title == 'Adherence' ? '$value%' : title == 'Next Dose' ? '$value:00 PM' : '$value',
              style: AppStyles.textStyle15W600Black,
            ),
          ],
        ),
      ],
    );
  }
}


