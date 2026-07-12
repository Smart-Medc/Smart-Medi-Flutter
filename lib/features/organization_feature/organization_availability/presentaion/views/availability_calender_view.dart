import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/organization_drawer.dart';
import 'widgets/availability_calender_view_body.dart';

class AvailabilityCalenderView extends StatelessWidget {
  const AvailabilityCalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: AvailabilityCalenderViewBody(),
        drawer: OrganizationDrawer(selectedItem: OrganizationDrawerItem.availability),
      ),
    );
  }
}