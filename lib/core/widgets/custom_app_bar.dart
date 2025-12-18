import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 25.0.w),
      child: Row(
        children: [
          InkWell(onTap: (){
            Scaffold.of(context).openDrawer();
          },child: Icon(Icons.menu,size: 40.sp,)),
          const Spacer(),
          CircleAvatar(
            radius: 20.r,
            backgroundImage: const AssetImage('assets/images/facebook_icon.png'),
          ),
        ],
      ),
    );
  }
}
