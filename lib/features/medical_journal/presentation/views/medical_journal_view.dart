import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_view_body.dart';

class MedicalJournalView extends StatelessWidget {
  const MedicalJournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: const MedicalJournalViewBody(),
        drawer: const AppDrawer(selectedItem: DrawerItem.journal),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.push(AppRoutes.addJournalEntry);
          },
          backgroundColor: AppColors.primaryColor,
          icon: Icon(Icons.add, size: 24.sp, color: Colors.white),
          label: Text(
            'Add Entry',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}



