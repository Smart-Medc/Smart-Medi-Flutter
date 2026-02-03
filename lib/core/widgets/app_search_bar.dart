import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/card_container.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.hintText = 'Search',
    this.showFilter = true,
  });

  final String hintText;
  final bool showFilter;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: EdgeInsets.only(top: 18.h, bottom: 29.h),
      backgroundColor: const Color(0xffF8F8F8),
      borderColor: const Color(0xffF8F8F8),
      borderRadius: BorderRadius.circular(7.r),
      child: SizedBox(
        height: 58.h,
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
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: const Color(0xff7D7D7D),
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            if (showFilter)
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
      ),
    );
  }
}

