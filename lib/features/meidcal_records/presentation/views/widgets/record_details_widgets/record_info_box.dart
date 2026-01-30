import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_shadows.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class RecordInfoBox extends StatelessWidget {
  const RecordInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 40.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: AppShadows.large,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Record Info',
              style: AppStyles.textStyle24W600Black,
            ),
            20.verticalSpace,
            Row(
              children: [
                20.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoItem(title: 'Type', value: 'Imaging'),
                    10.verticalSpace,
                    infoItem(title: 'Date', value: 'Mar 10, 2024'),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    infoItem(title: 'File Size', value: '8.1 MB'),
                    10.verticalSpace,
                    infoItem(title: 'Format', value: 'DICOM'),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget infoItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle10W400LightGrey,
        ),
        4.verticalSpace,
        Text(
          value,
          style: AppStyles.textStyle15W600Black,
        ),
      ],
    );
  }
}
