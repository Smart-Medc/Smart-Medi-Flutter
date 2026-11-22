import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class PreviewSection extends StatelessWidget {
  const PreviewSection({
    super.key,
    required this.selectedRecords,
  });

  final List<String> selectedRecords;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CardContainer(
        padding: EdgeInsets.only(left: 18.w, top: 15.h, bottom: 14.h),
        backgroundColor: AppColors.iconBGGreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preview',
              style: AppStyles.textStyle12W500Black,
            ),
            8.verticalSpace,
            Text(
              'You are about to share ${selectedRecords.length} record(s)',
              style: AppStyles.textStyle10W400DarkGrey,
            ),
            12.verticalSpace,
        
            if (selectedRecords.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Center(
                  child: Text(
                    'No records selected',
                    style: AppStyles.textStyle12W400DarkGrey,
                  ),
                ),
              )
            else
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: selectedRecords.map((name) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.iconCyan,
                      borderRadius: BorderRadius.circular(999.r),
                    ),
                    child: Text(
                      name,
                      style: AppStyles.textStyle10W400White,
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}

