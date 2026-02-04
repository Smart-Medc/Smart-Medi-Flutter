import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/current_medication.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/past_medication.dart';

class MedicationTabs extends StatefulWidget {
  const MedicationTabs({super.key});

  @override
  State<MedicationTabs> createState() => _MedicationTabsState();
}

class _MedicationTabsState extends State<MedicationTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.formFieldBGColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  title: 'Current Medication',
                  index: 0,
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  title: 'Past Medication',
                  index: 1,
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        _selectedTab == 0 ? _buildCurrentMedications() : _buildPastMedications(),
      ],
    );
  }

  Widget _buildTabButton({required String title, required int index}) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        margin: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.textWhite : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            title,
            style: isSelected
                ? AppStyles.textStyle12W500Black
                : AppStyles.textStyle12W500DarkGrey,
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentMedications() {
    return Column(
      children: [
        const CurrentMedication(
          medicationName: 'Metformin',
          dosage: '500 mg',
          frequency: 'Twice daily',
          type: 'Oral',
          startDate: 'Jan 15, 2024',
          doctorName: 'Sarah Johnson',
          adherence: 95,
        ),
        16.verticalSpace,
        const CurrentMedication(
          medicationName: 'Lisinopril',
          dosage: '10 mg',
          frequency: 'Once daily',
          type: 'Oral',
          startDate: 'Feb 1, 2024',
          doctorName: 'Sarah Johnson',
          adherence: 70,
          hasInteraction: true,
        ),
        16.verticalSpace,
        const CurrentMedication(
          medicationName: 'Lisinopril',
          dosage: '10 mg',
          frequency: 'Once daily',
          type: 'Oral',
          startDate: 'Feb 1, 2024',
          doctorName: 'Sarah Johnson',
          adherence: 30,
          hasInteraction: true,
        ),
      ],
    );
  }

  Widget _buildPastMedications() {
    return const Column(
      children: [
        PastMedication(
          medicationName: 'Amoxicillin',
          dosage: '250 mg',
          frequency: 'Three times daily',
          type: 'Oral',
          startDate: 'Dec 10, 2023',
          endDate: 'Dec 20, 2023',
          doctorName: 'Mike Smith',
        ),
      ],
    );
  }
}

