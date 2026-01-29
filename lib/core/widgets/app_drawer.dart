import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';

enum DrawerItem {
  home,
  medicalRecords,
  medications,
  journal,
  aiAssistant,
  appointments,
  dataSharing,
  notifications,
  settings,
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.selectedItem});

  final DrawerItem selectedItem;

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
                    style: AppStyles
                        .textStyle16W400LightGrey, // todo, would be updated after design system is ready
                  ),
                  4.verticalSpace,
                  Text(
                    'omarmohamed@gmail.com',
                    style: AppStyles
                        .textStyle16W400LightGrey, // todo, would be updated after design system is ready
                  ),
                ],
              ),
            ],
          ),
          56.verticalSpace,
          _DrawerItem(
            icon: Icons.home_outlined,
            title: 'Home',
            onTap: () {
              GoRouter.of(context).pop();
              GoRouter.of(context).push(AppRoutes.homeView);
            },
            isSelected: selectedItem == DrawerItem.home,
          ),
          _DrawerItem(
            icon: Icons.medical_information_outlined,
            title: 'Medical Records',
            onTap: () {
              GoRouter.of(context).pop();
              GoRouter.of(context).push(AppRoutes.medicalRecords);
            },
            isSelected: selectedItem == DrawerItem.medicalRecords,
          ),
          _DrawerItem(
            icon: Icons.medication_outlined,
            title: 'Medications',
            onTap: () {
              Navigator.pop(context);
              // Navigate to medications
            },
            isSelected: selectedItem == DrawerItem.medications,
          ),
          _DrawerItem(
            icon: Icons.book_outlined,
            title: 'Journal',
            onTap: () {
              Navigator.pop(context);
              // Navigate to journal
            },
            isSelected: selectedItem == DrawerItem.journal,
          ),
          _DrawerItem(
            icon: Icons.smart_toy_outlined,
            title: 'AI Assistant',
            onTap: () {
              Navigator.pop(context);
              // Navigate to AI assistant
            },
            isSelected: selectedItem == DrawerItem.aiAssistant,
          ),
          _DrawerItem(
            icon: Icons.calendar_today_outlined,
            title: 'Appointments',
            onTap: () {
              Navigator.pop(context);
              // Navigate to appointments
            },
            isSelected: selectedItem == DrawerItem.appointments,
          ),
          _DrawerItem(
            icon: Icons.share_outlined,
            title: 'Data Sharing',
            onTap: () {
              Navigator.pop(context);
              // Navigate to data sharing
            },
            isSelected: selectedItem == DrawerItem.dataSharing,
          ),
          _DrawerItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            onTap: () {
              Navigator.pop(context);
              // Navigate to notifications
            },
            isSelected: selectedItem == DrawerItem.notifications,
          ),
          _DrawerItem(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {
              Navigator.pop(context);
              // Navigate to settings
            },
            isSelected: selectedItem == DrawerItem.settings,
          ),
          73.verticalSpace,
          const Divider(thickness: .2),
          10.verticalSpace,
          Text('Colour Scheme', style: AppStyles.textStyle16W400LightGrey), // todo, would be updated after design system is ready
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
          color: isSelected ? AppColors.white : AppColors.textDarkGrey,
          size: 28.sp,
        ),
        title: Text(
          title,
          style: isSelected ? AppStyles.textStyle18W700Black : AppStyles.textStyle12W400DarkGrey,
        ),
        onTap: onTap,
      ),
    );
  }
}
