import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/current_medication.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/past_medication.dart';

class MedicationTabs extends StatelessWidget {
  const MedicationTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabs(
      tabTitles: const [
        'Current Medication',
        'Past Medication',
      ],
      tabContents: [
        _buildCurrentMedications(),
        _buildPastMedications(),
      ],
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

