import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/delete_medical_record_cubit/delete_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_cubit/get_medical_records_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_statistics_cubit/get_medical_records_statistics_cubit.dart';

class DeleteMedicalRecordListener extends StatelessWidget {
  const DeleteMedicalRecordListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<
        DeleteMedicalRecordCubit,
        DeleteMedicalRecordState>(
        listener: (context, state) {
          if (state is DeleteMedicalRecordSuccess) {
            context.showSnackBar(const Text('Record deleted successfully'));

            context.read<GetMedicalRecordsCubit>().getMedicalRecords();
            context.read<GetMedicalRecordsStatisticsCubit>().getMedicalRecordsStatistics();
          }

          if (state is DeleteMedicalRecordFailure) {
            context.showSnackBar(Text(state.message));
          }
        },

        child: child,
    );
  }
}
