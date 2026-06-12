import 'package:flutter/material.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/organization_feature/Dashboard/presentation/views/widgets/organization_dashboard_body.dart';


class OrganizationDashboardView extends StatelessWidget {
  const OrganizationDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteBackgroundColor,
      body: OrganizationDashboardBody(),
    );
  }
}
