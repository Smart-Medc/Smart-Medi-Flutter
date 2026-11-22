import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class BoxCodeAndCopyButtons extends StatelessWidget {
  const BoxCodeAndCopyButtons({super.key, required this.accessCode, required this.url});
  final String accessCode;
  final String url;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CardContainer(
            padding: EdgeInsets.only(top: 14.h, bottom: 29.h),
            backgroundColor: AppColors.greyBackgroundColor,
            child: Column(
              children: [
                Text('Access Code', style: AppStyles.textStyle10W400DarkGrey),
                15.verticalSpace,
                Text(accessCode, style: AppStyles.textStyle24W600Black),
              ],
            ),
          ),
        ),
        14.verticalSpace,
        _buildButton(
          text: 'Copy Code',
          icon: Icons.copy,
          onTap: () {
            Clipboard.setData(
              ClipboardData(text: accessCode),
            );
          },
        ),
        10.verticalSpace,
        _buildButton(
          text: 'Copy URL',
          icon: Icons.link,
          onTap: () {
            Clipboard.setData(
              ClipboardData(text: url),
            );
          },
        ),
        10.verticalSpace,
        _buildButton(
          text: 'Send EMail',
          icon: Icons.email,
          onTap: () {
            // Implement revoke access functionality
          },
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.formFieldStrokeColor),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.textBlack, size: 18.sp),
            8.horizontalSpace,
            Text(text, style: AppStyles.textStyle12W500Black),
          ],
        ),
      ),
    );
  }
}
