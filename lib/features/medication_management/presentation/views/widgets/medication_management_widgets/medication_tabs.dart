import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/custom_tabs.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/current_medication.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/past_medication.dart';

class MedicationTabs extends StatelessWidget {
  const MedicationTabs({
    super.key,
    required this.currentMedications,
    required this.pastMedications,
  });

  final List<MedicationModel> currentMedications;
  final List<MedicationModel> pastMedications;

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
      // Tabs expand to fill width equally
    );
  }

  Widget _buildCurrentMedications() {
    if (currentMedications.isEmpty) {
      return const _EmptyMedications(text: 'No current medications');
    }

    return Column(
      children: List.generate(currentMedications.length, (index) {
        final medication = currentMedications[index];
        return Padding(
          padding: EdgeInsets.only(bottom: index == currentMedications.length - 1 ? 0 : 16.h),
          child: CurrentMedication(
            medicationName: medication.name,
            dosage: medication.dosage,
            frequency: medication.frequency,
            type: medication.routeName.isNotEmpty ? medication.routeName : medication.route,
            startDate: _formatDate(medication.startDate),
            doctorName: medication.prescribingDoctor,
            adherence: medication.adherencePercentage.round().clamp(0, 100),
            hasInteraction: medication.hasInteraction,
          ),
        );
      }),
    );
  }

  Widget _buildPastMedications() {
    if (pastMedications.isEmpty) {
      return const _EmptyMedications(text: 'No past medications');
    }

    return Column(
      children: List.generate(pastMedications.length, (index) {
        final medication = pastMedications[index];
        return Padding(
          padding: EdgeInsets.only(bottom: index == pastMedications.length - 1 ? 0 : 16.h),
          child: PastMedication(
            medicationName: medication.name,
            dosage: medication.dosage,
            frequency: medication.frequency,
            type: medication.routeName.isNotEmpty ? medication.routeName : medication.route,
            startDate: _formatDate(medication.startDate),
            endDate: medication.endDate == null ? '--' : _formatDate(medication.endDate!),
            doctorName: medication.prescribingDoctor,
          ),
        );
      }),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}

class _EmptyMedications extends StatelessWidget {
  const _EmptyMedications({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}

