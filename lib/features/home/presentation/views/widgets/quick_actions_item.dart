import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class QuickActionsItem extends StatelessWidget {
  const QuickActionsItem({super.key, required this.title, required this.subtitle, required this.icon, required this.containerColor, required this.iconColor, this.onTap});
  final String title;
  final String subtitle;
  final IconData icon;
  final Color containerColor;
  final Color iconColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardContainer(
        child: SizedBox(
          height: 80.h,
          width: 220.w,
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
                Text(subtitle,style: AppStyles.textStyle10W400LightGrey,),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}
