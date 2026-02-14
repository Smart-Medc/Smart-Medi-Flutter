import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class SharedRecordsInfo extends StatelessWidget {
  const SharedRecordsInfo({
    super.key,
    required this.sharedRecords,
    required this.expirationDate,
  });

  final List<String> sharedRecords;
  final String expirationDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardContainer(
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shared Records (${sharedRecords.length})',
              style: AppStyles.textStyle18W700Black,
            ),
            16.verticalSpace,

            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: sharedRecords.map((record) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.iconCyan,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    record,
                    style: AppStyles.textStyle14W400Black.copyWith(
                      color: AppColors.textWhite,
                    ),
                  ),
                );
              }).toList(),
            ),

            16.verticalSpace,

            Text(
              'Expires: $expirationDate',
              style: AppStyles.textStyle14W400DarkGrey.copyWith(
                color: AppColors.textLightGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

