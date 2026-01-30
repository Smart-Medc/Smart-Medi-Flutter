import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class HomeViewRecentRecords extends StatelessWidget {
  const HomeViewRecentRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25.w),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffC8C8C8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff696969).withValues(alpha: 0.2),
            blurRadius: 10.r,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.contact_page, // todo edit the icon
                color: AppColors.primaryColor,
                size: 18.sp,
              ),
              6.horizontalSpace,
              Text(
                'Recent Records',
                style: AppStyles.textStyle15W600Black,
              ),
              const Spacer(),
              Text(
                'View All',
                  style: AppStyles.textStyle10W500DarkGrey,
              ),
            ],
          ),
          23.verticalSpace,
          _recordItem(recordTitle: 'Blood Test Results', recordType: 'Lab Report', recordDate: '2 days ago'),
          8.verticalSpace,
          _recordItem(recordTitle: 'X-Ray - Chest', recordType: 'Imaging', recordDate: '1 week ago'),
          8.verticalSpace,
          _recordItem(recordTitle: 'Annual Checkup Notes', recordType: 'Consultation', recordDate: '2 weeks ago'),
        ],
      ),
    );
  }
  Widget _recordItem({required String recordTitle, required String recordType, required String recordDate}){
    return Container(
        padding: EdgeInsets.only(top: 8.h,left: 10.w,right: 18.w,bottom: 7.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: const Color(0xffC8C8C8)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff696969).withValues(alpha: 0.2),
              blurRadius: 10.r,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 27.h,
              width: 27.w,
              decoration: BoxDecoration(
                color: const Color(0xffE7F8FA),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.contact_page, // todo edit the icon
                color: AppColors.primaryColor,
                size: 18.sp,
              ),
            ),
            8.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recordTitle,
                  style: AppStyles.textStyle12W600Black,
                ),
                Text(
                  '$recordType • $recordDate',
                  style: AppStyles.textStyle10W400LightGrey,
                ),
              ],
            ),
            const Spacer(),
            Text('View',style: AppStyles.textStyle10W500DarkGrey,),
          ],
        )
    );
  }
}
