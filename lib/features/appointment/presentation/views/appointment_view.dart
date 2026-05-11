import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/appointment/presentation/views/widgets/appointments_view_widgets/appointments_view_body.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: AppointmentsViewBody(),
        drawer: AppDrawer(selectedItem: DrawerItem.appointments),
      ),
    );
  }
}
