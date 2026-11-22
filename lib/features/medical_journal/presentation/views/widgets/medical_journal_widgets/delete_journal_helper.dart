import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/delete_journal_cubit/delete_journal_cubit.dart';

Future<void> confirmAndDeleteJournal({
  required BuildContext context,
  required String journalId,
  required String journalTitle,
}) async {
  final shouldDelete = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Entry'),
        content: Text('Are you sure you want to delete "$journalTitle"?'),
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
    context.read<DeleteJournalCubit>().deleteJournal(journalId: journalId);
  }
}

