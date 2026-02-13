import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/data_sharing/data/models/shared_record_model.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/shared_record_item_header.dart';

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
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.formFieldBGColor,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      sharedRecord.id,
                      style: AppStyles.textStyle14W400Black,
                    ),
                    8.horizontalSpace,
                    InkWell(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: sharedRecord.id));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('ID copied to clipboard'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.copy,
                        size: 16.sp,
                        color: AppColors.textDarkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          12.verticalSpace,

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
                'Created: ${_formatDate(sharedRecord.createdDate)}',
                style: AppStyles.textStyle12W400DarkGrey,
              ),
              16.horizontalSpace,
              Icon(
                Icons.event_busy_outlined,
                size: 14.sp,
                color: AppColors.textDarkGrey,
              ),
              4.horizontalSpace,
              Text(
                'Expires: ${_formatDate(sharedRecord.expiresDate)}',
                style: AppStyles.textStyle12W400DarkGrey,
              ),
            ],
          ),
          12.verticalSpace,

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
          16.verticalSpace,

          // Shared Records section
          Text('Shared Records:', style: AppStyles.textStyle14W400Black),
          8.verticalSpace,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: sharedRecord.sharedRecords
                .map(
                  (record) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: AppColors.formFieldStrokeColor),
                    ),
                    child: Text(record, style: AppStyles.textStyle12W500Black),
                  ),
                )
                .toList(),
          ),
          16.verticalSpace,

          // Action buttons
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Copy link functionality
                    Clipboard.setData(
                      ClipboardData(
                        text: 'https://smartmedi.app/share/${sharedRecord.id}',
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Link copied to clipboard'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.formFieldBGColor,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.link,
                          size: 18.sp,
                          color: AppColors.textBlack,
                        ),
                        8.horizontalSpace,
                        Text(
                          'Copy Link',
                          style: AppStyles.textStyle14W400Black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: InkWell(
                  onTap: () {
                    // Show revoke confirmation dialog
                    _showRevokeDialog(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: AppColors.iconBGRed,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.block,
                          size: 18.sp,
                          color: AppColors.iconRed,
                        ),
                        8.horizontalSpace,
                        Text(
                          'Revoke Access',
                          style: AppStyles.textStyle14W400Black.copyWith(
                            color: AppColors.iconRed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showRevokeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Revoke Access'),
        content: Text(
          'Are you sure you want to revoke access for ${sharedRecord.sharedWith}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Handle revoke action
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Access revoked successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.iconRed),
            child: const Text('Revoke'),
          ),
        ],
      ),
    );
  }
}
