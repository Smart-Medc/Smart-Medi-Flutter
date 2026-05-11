import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/delete_medication_cubit/delete_medication_cubit.dart';

Future<void> confirmAndDeleteMedication({
  required BuildContext context,
  required String medicationId,
  required String medicationName,
}) async {
  final shouldDelete = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Medication'),
        content: Text('Are you sure you want to delete "$medicationName"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );

  if (shouldDelete == true && context.mounted) {
    context.read<DeleteMedicationCubit>().deleteMedication(
      medicationId: medicationId,
    );
  }
}

