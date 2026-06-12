import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'widgets/access_patient_data_view_body.dart';

class AccessPatientDataView extends StatelessWidget {
  const AccessPatientDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: AccessPatientDataViewBody(),
      ),
    );
  }
}
