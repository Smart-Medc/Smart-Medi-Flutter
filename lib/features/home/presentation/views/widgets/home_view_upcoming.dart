import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class HomeViewUpcoming extends StatelessWidget {
  const HomeViewUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 25.w),
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
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today,color: const Color(0xff2BC5D9),size: 22.sp,),
              4.horizontalSpace,
              Text('Upcoming',style: AppStyles.textStyle15W600Black,),
            ],
          ),
          8.verticalSpace,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 25.w),
            decoration: BoxDecoration(
              color: const Color(0xffBEDDE0),
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: const Color(0xffBEDDE0))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dr.Ammar Abo shakha',style: AppStyles.textStyle12W600Black,),
                4.verticalSpace,
                Text('Tomorrow 2:00 PM',style: AppStyles.textStyle10W400LightGrey,),
                4.verticalSpace,
                Text('Annual Checkup',style: AppStyles.textStyle10W400TextBlue,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
