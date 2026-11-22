import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/delete_medication_bloc_listener.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_content_sliver_group.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_slivers.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_data_utils.dart';

class MedicationManagementDataSection extends StatelessWidget {
  const MedicationManagementDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DeleteMedicationBlocListener(
      child: BlocBuilder<GetMedicationsCubit, GetMedicationsState>(
        builder: (context, state) {
          if (state is GetMedicationsLoading || state is GetMedicationsInitial) {
            return const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is GetMedicationsFailure) {
            return MedicationLoadErrorSliver(message: state.message);
          }

          if (state is GetMedicationsSuccess) {
            final allMedications = state.medications.medications;
            final currentMedications = allMedications
                .where(isCurrentMedication)
                .toList(growable: false);
            final pastMedications = allMedications
                .where(isPastMedication)
                .toList(growable: false);

            return MedicationDataContentSliverGroup(
              currentMedications: currentMedications,
              pastMedications: pastMedications,
            );
          }

          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
      ),
    );
  }
}
