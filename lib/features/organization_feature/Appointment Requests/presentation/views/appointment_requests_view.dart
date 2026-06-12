import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'widgets/appointment_requests_view_body.dart';

class AppointmentRequestsView extends StatelessWidget {
  const AppointmentRequestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: AppointmentRequestsViewBody(),
        drawer: AppDrawer(selectedItem: DrawerItem.home),
      ),
    );
  }
}
