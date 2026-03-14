import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medication_management/data/models/get_medications_model/get_medication_response.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_summary.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_tabs.dart';

class MedicationManagementDataSection extends StatelessWidget {
  const MedicationManagementDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMedicationsCubit, GetMedicationsState>(
      builder: (context, state) {
        if (state is GetMedicationsLoading || state is GetMedicationsInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetMedicationsFailure) {
          return _MedicationLoadError(message: state.message);
        }

        if (state is GetMedicationsSuccess) {
          final allMedications = state.medications.medications;
          final currentMedications = allMedications
              .where(_isCurrentMedication)
              .toList(growable: false);
          final pastMedications = allMedications
              .where(_isPastMedication)
              .toList(growable: false);

          final interactionsCount = currentMedications
              .where((medication) => medication.hasInteraction)
              .length;

          final adherenceAverage = currentMedications.isEmpty
              ? 0
              : currentMedications
                        .map((medication) => medication.adherencePercentage)
                        .reduce((a, b) => a + b) /
                    currentMedications.length;

          return Column(
            children: [
              MedicationManagementSummary(
                currentCount: currentMedications.length,
                interactionsCount: interactionsCount,
                adherencePercentage: adherenceAverage.round().clamp(0, 100),
                nextDoseText: '--',
              ),
              24.verticalSpace,
              MedicationTabs(
                currentMedications: currentMedications,
                pastMedications: pastMedications,
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  bool _isCurrentMedication(MedicationModel medication) {
    // Business rule: only active medications are considered current.
    return medication.status.trim().toLowerCase() == 'active';
  }

  bool _isPastMedication(MedicationModel medication) {
    // Business rule: only complete medications are considered past.
    return medication.status.trim().toLowerCase() == 'complete';
  }
}

class _MedicationLoadError extends StatelessWidget {
  const _MedicationLoadError({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
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
              context
                  .read<GetMedicationsCubit>()
                  .loadMedicationsForCurrentPatient();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
