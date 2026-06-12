import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.actionText,
    this.onActionPressed,
    this.actionIcon = Icons.add,
  });

  final String title;
  final String subtitle;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final IconData actionIcon;

  @override
  Widget build(BuildContext context) {
    final hasAction = actionText != null && onActionPressed != null;
    final titleBlock = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle24W600Black,
        ),
        Text(
          subtitle,
          style: AppStyles.textStyle16W400LightGrey,
        ),
      ],
    );

    if (!hasAction) {
      return titleBlock;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: titleBlock),
        12.horizontalSpace,
        InkWell(
          onTap: onActionPressed,
          borderRadius: BorderRadius.circular(10.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              boxShadow: AppShadows.small,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Icon(actionIcon, color: AppColors.textWhite, size: 22.sp),
                8.horizontalSpace,
                Text(
                  actionText!,
                  style: AppStyles.textStyle12W500White,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
