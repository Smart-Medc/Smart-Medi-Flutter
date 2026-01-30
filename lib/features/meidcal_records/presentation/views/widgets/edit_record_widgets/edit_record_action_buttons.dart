import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';

class EditRecordActionButtons extends StatelessWidget {
  const EditRecordActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Save Changes',
            height: 48,
            textStyle: AppStyles.textStyle15W600White,
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: CustomButton(
            text: 'Cancel',
            height: 48,
            backgroundColor: AppColors.greyBackgroundColor,
            textStyle: AppStyles.textStyle15W600Black,
            boxShadow: AppShadows.small,
          ),
        ),
      ],
    );
  }
}
