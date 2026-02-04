import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_view_body.dart';

class MedicationManagementView extends StatelessWidget {
  const MedicationManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MedicationManagementViewBody(),
        drawer: AppDrawer(selectedItem: DrawerItem.medications),
      ),
    );
  }
}

