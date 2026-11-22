import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class DataSharingHintBox extends StatelessWidget {
  const DataSharingHintBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      backgroundColor: AppColors.iconBGBlue,
      borderColor: AppColors.iconBlue,
      padding: EdgeInsets.only(left: 25.w, top: 22.h, bottom: 13.h, right: 11.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.share, color: AppColors.primaryColor, size: 18.sp),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'How Secure Sharing Works',
                  style: AppStyles.textStyle15W600Black,
                ),
                8.verticalSpace,
                Text(
                  'Generate secure access codes or links to share specific medical records with healthcare providers. You control what they see, for how long, and can revoke access anytime. All access is logged and you will be notified.',
                  style: AppStyles.textStyle10W400LightGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
