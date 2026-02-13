import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/shared_record_actions.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/shared_record_item_copy_button.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/shared_record_item_header.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/shared_record_item_chips.dart';

class SharedRecordItem extends StatelessWidget {
  const SharedRecordItem({super.key, required this.sharedRecord});

  final SharedRecordModel sharedRecord;

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }



  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and status badge
          SharedRecordItemHeader(sharedRecord: sharedRecord,),
          16.verticalSpace,

          // ID with copy button
          SharedRecordItemCopyButton(sharedRecordId: sharedRecord.id),
          8.verticalSpace,

          // Created and Expires dates
          Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14.sp,
                color: AppColors.textDarkGrey,
              ),
              4.horizontalSpace,
              Text(
                'Created: ${_formatDate(sharedRecord.createdDate)}  •  Expires: ${_formatDate(sharedRecord.expiresDate)}',
                style: AppStyles.textStyle12W400DarkGrey,
              ),
            ],
          ),
          8.verticalSpace,

          // Accessed count
          Row(
            children: [
              Icon(
                Icons.visibility_outlined,
                size: 14.sp,
                color: AppColors.textDarkGrey,
              ),
              4.horizontalSpace,
              Text(
                'Accessed ${sharedRecord.accessedCount} times',
                style: AppStyles.textStyle12W400DarkGrey,
              ),
            ],
          ),
          13.verticalSpace,

          // Shared Records section
          SharedRecordItemChips(records: sharedRecord.sharedRecords),
          16.verticalSpace,

          const Divider(color: AppColors.formFieldStrokeColor,),

          16.verticalSpace,

          // Action buttons
          SharedRecordActions(
            recordId: sharedRecord.id,
            sharedWith: sharedRecord.sharedWith,
          ),
        ],
      ),
    );
  }
}
