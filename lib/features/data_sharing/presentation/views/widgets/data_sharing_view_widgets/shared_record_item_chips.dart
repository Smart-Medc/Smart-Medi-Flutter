import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

/// A widget that displays a list of shared record names as chips
/// in a horizontally scrollable view
class SharedRecordItemChips extends StatelessWidget {
  const SharedRecordItemChips({
    super.key,
    required this.records,
  });

  final List<String> records;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shared Records:', style: AppStyles.textStyle12W600Black),
        8.verticalSpace,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: records
                .map(
                  (record) => Container(
                    margin: EdgeInsets.only(right: 8.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(color: AppColors.formFieldStrokeColor),
                    ),
                    child: Text(record, style: AppStyles.textStyle10W400Black),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

