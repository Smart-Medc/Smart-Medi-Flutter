import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,style: AppStyles.textStyle40W700TextColor3,textAlign: TextAlign.center,),
        23.verticalSpace,
        Text(subTitle,style: AppStyles.textStyle14W400TextColor3,textAlign: TextAlign.center,)
      ],
    );
  }
}
