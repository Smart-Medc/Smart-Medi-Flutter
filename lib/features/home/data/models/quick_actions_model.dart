import 'package:flutter/material.dart';

class QuickActionsModel {
  QuickActionsModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.containerColor,
    required this.iconColor,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color containerColor;
  final Color iconColor;

  // Const list of quick actions
  static List<QuickActionsModel> quickActions = [
    QuickActionsModel(
      title: 'Upload Record',
      subtitle: 'Add new file',
      containerColor: const Color(0xffEBF2FE),
      iconColor: const Color(0xff3E85F6),
      icon: Icons.upload_file,
    ),
    QuickActionsModel(
      title: 'Book Appointments',
      subtitle: 'Find providers',
      containerColor: const Color(0xffE7F8FA),
      iconColor: const Color(0xff2BC5D9),
      icon: Icons.calendar_today,
    ),
    QuickActionsModel(
      title: 'Add Medication',
      subtitle: 'Track meds',
      containerColor: const Color(0xffEBF2FE),
      iconColor: const Color(0xff3E85F6),
      icon: Icons.medication,
    ),
    QuickActionsModel(
      title: 'Health Journal',
      subtitle: 'Track meds',
      containerColor: const Color(0xffE7F5EC),
      iconColor: const Color(0xff1FA550),
      icon: Icons.monitor_heart_outlined,
    ),
  ];
}
