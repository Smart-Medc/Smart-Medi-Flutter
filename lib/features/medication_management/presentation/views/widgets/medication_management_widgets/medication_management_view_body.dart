import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/add_medication_button.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_summary.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_tabs.dart';

class MedicationManagementViewBody extends StatelessWidget {
  const MedicationManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 25.w, right: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            32.verticalSpace,
            const AppHeader(
              title: 'Medication Management',
              subtitle: 'Track your medications and set reminders',
            ),
            const AppSearchBar(hintText: 'Search medications',showFilter: false,),
            const MedicationManagementSummary(),
            24.verticalSpace,
            const MedicationTabs(),
            16.verticalSpace,
            const SizedBox(width: double.infinity, child: AddMedicationButton()),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}

