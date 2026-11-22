import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/delete_journal_cubit/delete_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/get_medical_journals/get_medical_journals_cubit.dart';

class DeleteJournalBlocListener extends StatelessWidget {
  const DeleteJournalBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteJournalCubit, DeleteJournalState>(
      listenWhen: (previous, current) =>
          current is DeleteJournalSuccess || current is DeleteJournalFailure,
      listener: (context, state) {
        if (state is DeleteJournalSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Journal entry deleted successfully'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          context
              .read<GetMedicalJournalsCubit>()
              .getMedicalJournalsForCurrentPatient();
        } else if (state is DeleteJournalFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: child,
    );
  }
}

