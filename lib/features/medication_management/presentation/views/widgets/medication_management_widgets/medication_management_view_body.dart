import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/add_medication_button.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_data_section.dart';

class MedicationManagementViewBody extends StatelessWidget {
  const MedicationManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
          sliver: SliverMainAxisGroup(
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              const SliverToBoxAdapter(
                child: AppHeader(
                  title: 'Medication Management',
                  subtitle: 'Track your medications and set reminders',
                ),
              ),
              const SliverToBoxAdapter(
                child: AppSearchBar(hintText: 'Search medications', showFilter: false),
              ),
              const MedicationManagementDataSection(),
              SliverToBoxAdapter(child: 16.verticalSpace),
              const SliverToBoxAdapter(
                child: SizedBox(width: double.infinity, child: AddMedicationButton()),
              ),
              SliverToBoxAdapter(child: 100.verticalSpace),
            ],
          ),
        ),
      ],
    );
  }
}


