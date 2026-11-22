import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/status_badge.dart';
import 'package:smart_medi/features/data_sharing/data/models/get_shared_records_models/get_shared_records_response.dart';
class SharedRecordItemHeader extends StatelessWidget {
  const SharedRecordItemHeader({super.key, required this.sharedRecord});
  final SharedRecordModel sharedRecord;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Shared Record',
          style: AppStyles.textStyle15W600Black,
        ),
        8.horizontalSpace,
        StatusBadge(
          text: sharedRecord.status,
          backgroundColor: sharedRecord.isActive
              ? AppColors.iconBGBlue
              : AppColors.iconBGRed,
          textColor: sharedRecord.isActive
              ? AppColors.primaryColor
              : AppColors.iconRed,
          textStyle: AppStyles.textStyle12W600Black.copyWith(
            color: sharedRecord.isActive
                ? AppColors.primaryColor
                : AppColors.iconRed,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ],
    );
  }
}

