import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_header.dart';

class DataSharingHeader extends StatelessWidget {
  const DataSharingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      title: 'Secure Data Sharing',
      subtitle: 'Control who can access your medical records',
      actionText: 'Share Records',
      onActionPressed: () => context.push(AppRoutes.shareRecordsView),
    );
  }
}
