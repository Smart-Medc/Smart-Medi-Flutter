import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class QuickActionsItem extends StatelessWidget {
  const QuickActionsItem({super.key, required this.title, required this.subtitle, required this.icon, required this.containerColor, required this.iconColor});
  final String title;
  final String subtitle;
  final IconData icon;
  final Color containerColor;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 220.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.red , // todo change when the design system is ready
        ),
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
          15.horizontalSpace,
          Container(
            height: 36.h,
            width: 36.w,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(icon,color: iconColor,size: 24.sp,),
            ),
          ),
          7.horizontalSpace,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: AppStyles.textStyle15W600Black,),
              2.verticalSpace,
              Text(subtitle,style: AppStyles.textStyle10W400Brown,),
            ],
          )
        ],
      ),
    );
  }
}
