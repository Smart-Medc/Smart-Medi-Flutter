import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      margin: EdgeInsets.only(top: 18.h, bottom: 29.h,right: 25.w),
      decoration: BoxDecoration(
        color: const Color(0xffF8F8F8),
        borderRadius: BorderRadius.circular(7.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Icon(
              Icons.search,
              color: const Color(0xff7D7D7D),
              size: 20.sp,
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search doctors',
                hintStyle: TextStyle(
                  color: const Color(0xff7D7D7D),
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(4.w),
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              Icons.filter_alt_outlined,
              color: Colors.white,
              size: 24.sp,
            ),
          ),
        ],
      ),
    );
  }
}
