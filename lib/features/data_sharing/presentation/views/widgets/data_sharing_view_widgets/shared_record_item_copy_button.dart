import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';
class SharedRecordItemCopyButton extends StatelessWidget {
  const SharedRecordItemCopyButton({super.key, required this.code});
  final String code; // Example ID, replace with actual data
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.formFieldBGColor,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
          code,
            style: AppStyles.textStyle14W400Black,
          ),
        ),
        8.horizontalSpace,
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: code));
            context.showSnackBar(const Text('Code copied to clipboard'),);
          },
          child: const IconWithBackground(icon: Icons.copy,backgroundColor: AppColors.greyBackgroundColor, iconColor: AppColors.textBlack,iconSize: 16,),
        ),
      ],
    );
  }
}
