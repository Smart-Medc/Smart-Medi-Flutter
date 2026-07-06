import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_record_details_cubit/get_medical_record_details_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_details_content.dart';

class RecordDetailsBlocBuilder extends StatelessWidget {
  const RecordDetailsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
        GetMedicalRecordDetailsCubit,
        GetMedicalRecordDetailsState>(
      builder: (context, state) {
        if (state is GetMedicalRecordDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetMedicalRecordDetailsFailure) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        }

        if (state is GetMedicalRecordDetailsSuccess) {
          return RecordDetailsContent(
            medicalRecordDetails: state.medicalRecordDetailsResponse,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}