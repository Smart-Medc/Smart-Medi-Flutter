import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/icon_with_background.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem._({
    super.key,
    required this.title,
    required this.value,
    required this.leadingWidget,
  });

  /// Summary item with icon and background
  SummaryItem.icon({
    Key? key,
    required String title,
    required String value,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
  }) : this._(
         key: key,
         title: title,
         value: value,
         leadingWidget: IconWithBackground(
           icon: icon,
           backgroundColor: backgroundColor,
           iconColor: iconColor,
         ),
       );

  /// Summary item with blue line
  SummaryItem.line({Key? key, required String title, required String value})
    : this._(
        key: key,
        title: title,
        value: value,
        leadingWidget: Container(
          width: 4.w,
          height: 30.h,
          color: AppColors.primaryColor,
        ),
      );
  final String title;
  final String value;
  final Widget leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leadingWidget,
        8.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.textStyle10W400DarkGrey),
            Text(value, style: AppStyles.textStyle15W600Black),
          ],
        ),
      ],
    );
  }
}
