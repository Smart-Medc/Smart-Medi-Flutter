import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/auth_helper.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/logout_button.dart';

enum OrganizationDrawerItem {
  dashboard,
  accessPatients,
  availability,
  appointmentRequests,
  notifications,
}

class OrganizationDrawer extends StatefulWidget {
  const OrganizationDrawer({
    super.key,
    required this.selectedItem,
  });

  final OrganizationDrawerItem selectedItem;

  @override
  State<OrganizationDrawer> createState() => _OrganizationDrawerState();
}

class _OrganizationDrawerState extends State<OrganizationDrawer> {
  String _userName = 'Organization';
  String _userEmail = 'organization@example.com';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final userName = await AuthHelper.getCurrentUserName();
    final userEmail = await AuthHelper.getCurrentUserEmail();

    if (!mounted) return;

    setState(() {
      _userName = userName ?? 'Organization';
      _userEmail = userEmail ?? 'organization@example.com';
    });
  }

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
                  Icons.local_hospital,
                  size: 34.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _userName,
                      style: AppStyles.textStyle16W400LightGrey,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Text(
                      _userEmail,
                      style: AppStyles.textStyle16W400LightGrey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),

          56.verticalSpace,

          _DrawerItem(
            icon: Icons.dashboard_outlined,
            title: 'Dashboard',
            isSelected:
            widget.selectedItem == OrganizationDrawerItem.dashboard,
            onTap: () {
              context.pop();
              context.push(AppRoutes.organizationDashboardView);
            },
          ),

          _DrawerItem(
            icon: Icons.people_outline,
            title: 'Access Patients',
            isSelected:
            widget.selectedItem ==
                OrganizationDrawerItem.accessPatients,
            onTap: () {
              context.pop();
              context.push(AppRoutes.organizationAccessPatientDataView);
            },
          ),

          _DrawerItem(
            icon: Icons.schedule_outlined,
            title: 'Availability',
            isSelected:
            widget.selectedItem ==
                OrganizationDrawerItem.availability,
            onTap: () {
              context.pop();
              context.push(AppRoutes.organizationAvailabilityCalenderView);
            },
          ),

          _DrawerItem(
            icon: Icons.calendar_month_outlined,
            title: 'Appointment Requests',
            isSelected:
            widget.selectedItem ==
                OrganizationDrawerItem.appointmentRequests,
            onTap: () {
              context.pop();
            },
          ),

          _DrawerItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            isSelected:
            widget.selectedItem ==
                OrganizationDrawerItem.notifications,
            onTap: () {
              context.pop();
            },
          ),

          80.verticalSpace,

          const Divider(thickness: .2),

          10.verticalSpace,

          const LogoutListTile(),
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
        color: isSelected
            ? AppColors.primaryColor
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? AppColors.white
              : AppColors.textDarkGrey,
          size: 28.sp,
        ),
        title: Text(
          title,
          style: isSelected
              ? AppStyles.textStyle18W700Black
              : AppStyles.textStyle12W400DarkGrey,
        ),
        onTap: onTap,
      ),
    );
  }
}