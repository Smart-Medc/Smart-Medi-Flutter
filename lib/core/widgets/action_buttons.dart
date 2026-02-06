import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/custom_button.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.primaryButtonText,
    this.onPrimaryPressed,
    this.onCancelPressed,
  });

  final String primaryButtonText;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: primaryButtonText,
            height: 48,
            textStyle: AppStyles.textStyle15W600White,
            onPressed: onPrimaryPressed,
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
            onPressed: onCancelPressed ?? () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}

