import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

/// Top bar with hamburger menu and user avatar
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteBackgroundColor,
      elevation: 0,
      leadingWidth: 60.w,
      leading: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: AppColors.textBlack,
            size: 24.sp,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: const _UserAvatarWidget(),
        ),
      ],
    );
  }
}

class _UserAvatarWidget extends StatelessWidget {
  const _UserAvatarWidget();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: AppColors.grey,
      backgroundImage: const NetworkImage(
        'https://i.pravatar.cc/150?img=3',
      ),
    );
  }
}
