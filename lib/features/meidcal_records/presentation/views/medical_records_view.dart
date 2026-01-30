import 'package:flutter/material.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/meidcal_records/presentation/views/widgets/medical_records_view_widgets/medical_records_body.dart';

class MedicalRecordsView extends StatelessWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: MedicalRecordsBody(),
        drawer: AppDrawer(selectedItem: DrawerItem.medicalRecords),
      ),
    );
  }
}
