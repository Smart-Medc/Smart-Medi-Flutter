import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/add_journal_cubit/add_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_entry_form_fields.dart';

class AddJournalBlocListener extends StatelessWidget {
  const AddJournalBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddJournalCubit, AddJournalState>(
      listener: (context, state) {
        if (state is AddJournalLoading) {
          showLoadingDialog(context, message: 'Saving journal entry...');
        } else if (state is AddJournalSuccess) {
          GoRouter.of(context).pop();
          context.showSnackBar(const Text('Journal entry added successfully'));
          GoRouter.of(context).pop();
        } else if (state is AddJournalFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text(state.errorMessage));
        }
      },
      child: const AddJournalEntryFormFields(),
    );
  }
}