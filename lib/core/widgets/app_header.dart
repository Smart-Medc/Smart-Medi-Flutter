import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppStyles.textStyle24W600Black,),
        Text(subtitle,style: AppStyles.textStyle16W400LightGrey,),
      ],
    );
  }
}
