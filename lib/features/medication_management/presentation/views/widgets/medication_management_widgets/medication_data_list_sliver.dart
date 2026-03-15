import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/current_medication.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_slivers.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_utils.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/past_medication.dart';

class MedicationDataListSliver extends StatelessWidget {
  const MedicationDataListSliver({
    super.key,
    required this.selectedTabIndex,
    required this.medications,
  });

  final int selectedTabIndex;
  final List<MedicationModel> medications;

  @override
  Widget build(BuildContext context) {
    if (medications.isEmpty) {
      return SliverToBoxAdapter(
        child: MedicationEmptySliver(
          text: selectedTabIndex == 0
              ? 'No current medications'
              : 'No past medications',
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final medication = medications[index];
        return Padding(
          padding: EdgeInsets.only(
            bottom: index == medications.length - 1 ? 0 : 16.h,
          ),
          child: selectedTabIndex == 0
              ? CurrentMedication(
            medicationId: medication.id,
            medicationName: medication.name,
            dosage: medication.dosage,
            frequency: medication.frequency,
            type: medication.routeName.isNotEmpty
                ? medication.routeName
                : medication.route,
            startDate: formatMedicationDate(medication.startDate),
            doctorName: medication.prescribingDoctor,
            adherence: medication.adherencePercentage.round().clamp(0, 100),
            hasInteraction: medication.hasInteraction,
          )
              : PastMedication(
            medicationId: medication.id,
            medicationName: medication.name,
            dosage: medication.dosage,
            frequency: medication.frequency,
            type: medication.routeName.isNotEmpty
                ? medication.routeName
                : medication.route,
            startDate: formatMedicationDate(medication.startDate),
            endDate: medication.endDate == null
                ? '--'
                : formatMedicationDate(medication.endDate!),
            doctorName: medication.prescribingDoctor,
          ),
        );
      }, childCount: medications.length),
    );
  }
}
