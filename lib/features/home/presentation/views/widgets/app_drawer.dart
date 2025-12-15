import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        children: [
          40.verticalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 35.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              12.horizontalSpace,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mo ra',
                    style: AppStyles.textStyle18W700Black.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'omarmohamed@gmail.com',
                    style: AppStyles.textStyle14W400Black.copyWith(
                      color: Colors.black.withOpacity(0.9),
                    ),
                  ),
                ],
              )
            ],
          ),
          56.verticalSpace,
          _DrawerItem(
            icon: Icons.home_outlined,
            title: 'Home',
            onTap: () {
              Navigator.pop(context);
              // Navigate to home
            }, isSelected: true,
          ),
          _DrawerItem(
            icon: Icons.medical_information_outlined,
            title: 'Medical Record',
            onTap: () {
              Navigator.pop(context);
              // Navigate to medical record
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.medication_outlined,
            title: 'Medications',
            onTap: () {
              Navigator.pop(context);
              // Navigate to medications
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.book_outlined,
            title: 'Journal',
            onTap: () {
              Navigator.pop(context);
              // Navigate to journal
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.smart_toy_outlined,
            title: 'AI Assistant',
            onTap: () {
              Navigator.pop(context);
              // Navigate to AI assistant
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.calendar_today_outlined,
            title: 'Appointments',
            onTap: () {
              Navigator.pop(context);
              // Navigate to appointments
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.share_outlined,
            title: 'Data Sharing',
            onTap: () {
              Navigator.pop(context);
              // Navigate to data sharing
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {
              Navigator.pop(context);
              // Navigate to notifications
            }, isSelected: false,
          ),
          _DrawerItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings
            }, isSelected: false,
          ),
          73.verticalSpace,
          Divider(thickness: .2,),
          10.verticalSpace,
          Text('Colour Scheme',style: AppStyles.textStyle16W400Black,),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });
  final IconData icon;
  final String title;
  final bool isSelected;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? Colors.white : AppColors.textColor3,
          size: 28.sp,
        ),
        title: Text(
          title,
          style: AppStyles.textStyle16W400Black.copyWith(
            color: isSelected ? Colors.white : AppColors.textColor3,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

