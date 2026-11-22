import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/delete_medication_cubit/delete_medication_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';

class DeleteMedicationBlocListener extends StatelessWidget {
  const DeleteMedicationBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteMedicationCubit, DeleteMedicationState>(
      listenWhen: (previous, current) =>
          current is DeleteMedicationSuccess || current is DeleteMedicationFailure,
      listener: (context, state) {
        if (state is DeleteMedicationSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Medication deleted successfully')),
          );
          context.read<GetMedicationsCubit>().loadMedicationsForCurrentPatient();
        } else if (state is DeleteMedicationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: child,
    );
  }
}

