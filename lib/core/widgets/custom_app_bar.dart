import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_images.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 48.h),
      child: Row(
        children: [
          InkWell(onTap: (){
            Scaffold.of(context).openDrawer();
          },child: Icon(Icons.menu,size: 40.sp,)),
          const Spacer(),
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage(AppImages.profileImage),
          ),
        ],
      ),
    );
  }
}
