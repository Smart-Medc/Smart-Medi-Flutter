import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class MedicalRecordsShareDownloadButton extends StatelessWidget {
  const MedicalRecordsShareDownloadButton({super.key, required this.icon, required this.text, required this.backgroundColor, this.onTap, this.style, this.iconColor});
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final TextStyle? style;
  final VoidCallback? onTap;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,size: 16.sp,color: iconColor ?? Colors.black,),
            4.horizontalSpace,
            Text(
              text,
              style: style ?? AppStyles.textStyle12W600Black,
            ),
          ],
        ),
      ),
    );
  }
}
