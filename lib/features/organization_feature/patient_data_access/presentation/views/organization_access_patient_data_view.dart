import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'widgets/organization_access_patient_data_view_body.dart';

class OrganizationAccessPatientDataView extends StatelessWidget {
  const OrganizationAccessPatientDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: OrganizationAccessPatientDataViewBody(),
        drawer: AppDrawer(selectedItem: DrawerItem.home),
      ),
    );
  }
}
