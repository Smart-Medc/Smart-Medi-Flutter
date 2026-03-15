import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_summary.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_tabs.dart';

class MedicationDataHeaderSliver extends StatelessWidget {
  const MedicationDataHeaderSliver({
    super.key,
    required this.selectedIndex,
    required this.currentCount,
    required this.pastCount,
    required this.interactionsCount,
    required this.adherencePercentage,
    required this.onTabChanged,
  });

  final int selectedIndex;
  final int currentCount;
  final int pastCount;
  final int interactionsCount;
  final int adherencePercentage;
  final ValueChanged<int> onTabChanged;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          MedicationManagementSummary(
            currentCount: currentCount,
            interactionsCount: interactionsCount,
            adherencePercentage: adherencePercentage,
            nextDoseText: '--',
          ),
          24.verticalSpace,
          MedicationTabs(
            selectedIndex: selectedIndex,
            currentCount: currentCount,
            pastCount: pastCount,
            onTabChanged: onTabChanged,
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}


class MedicationLoadErrorSliver extends StatelessWidget {
  const MedicationLoadErrorSliver({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          children: [
            Text(
              message,
              style: AppStyles.textStyle12W500DarkGrey,
              textAlign: TextAlign.center,
            ),
            12.verticalSpace,
            TextButton(
              onPressed: () {
                context.read<GetMedicationsCubit>().loadMedicationsForCurrentPatient();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicationEmptySliver extends StatelessWidget {
  const MedicationEmptySliver({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Text(
        text,
        style: AppStyles.textStyle12W500DarkGrey,
        textAlign: TextAlign.center,
      ),
    );
  }
}

