import 'package:flutter/material.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';

class QuickActionsModel {
  QuickActionsModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
    required this.route,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color containerColor;
  final Color iconColor;
  final String route;

  // Const list of quick actions
  static List<QuickActionsModel> quickActions = [
    QuickActionsModel(
      title: 'Upload Record',
      subtitle: 'Add new file',
      containerColor: AppColors.iconBGBlue,
      iconColor: AppColors.iconBlue,
      icon: Icons.upload_file,
      route: AppRoutes.medicalRecords,
    ),
    QuickActionsModel(
      title: 'Book Appointments',
      subtitle: 'Find providers',
      containerColor: AppColors.iconBGCyan,
      iconColor: AppColors.iconCyan,
      icon: Icons.calendar_today,
      route: '', // Navigation disabled until appointments feature and route are added
    ),
    QuickActionsModel(
      title: 'Add Medication',
      subtitle: 'Track meds',
      containerColor: AppColors.iconBGCyan,
      iconColor: AppColors.iconCyan,
      icon: Icons.medication,
      route: AppRoutes.addMedication,
    ),
    QuickActionsModel(
      title: 'Health Journal',
      subtitle: 'Track meds',
      containerColor: AppColors.iconBGGreen,
      iconColor: AppColors.iconGreen,
      icon: Icons.monitor_heart_outlined,
      route: AppRoutes.medicalJournal,
    ),
  ];
}
