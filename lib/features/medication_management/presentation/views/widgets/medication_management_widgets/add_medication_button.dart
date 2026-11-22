import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class AddMedicationButton extends StatelessWidget {
  const AddMedicationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 15.h,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const IconWithBackground(
            icon: Icons.add,
            backgroundColor: AppColors.iconBGBlue,
            iconColor: AppColors.iconBlue,
          ),
          16.verticalSpace,
          Text(
            'Add New Medication',
            style: AppStyles.textStyle15W600Black,
          ),
          Text(
            'Track your medication and set reminders',
            style: AppStyles.textStyle10W400LightGrey,
          ),
          16.verticalSpace,
          InkWell(
            onTap: () {
              context.push(AppRoutes.addMedication);
            },
            child: Container(
              width: 88.w,
              height: 28.h,
              decoration: BoxDecoration(
                boxShadow: AppShadows.large,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.formFieldStrokeColor),
              ),
              child: Center(
                child: Text(
                  'Add Now',
                  style: AppStyles.textStyle14W400Black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

