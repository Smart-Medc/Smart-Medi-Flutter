import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/edit_journal_cubit/edit_journal_cubit.dart';

class EditJournalBlocListener extends StatelessWidget {
  const EditJournalBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditJournalCubit, EditJournalState>(
      listener: (context, state) {
        if (state is EditJournalLoading) {
          showLoadingDialog(context, message: 'Saving journal changes...');
        } else if (state is EditJournalSuccess) {
          GoRouter.of(context).pop();
          context.showSnackBar(const Text('Journal entry updated successfully'));
          GoRouter.of(context).pop(true);
        } else if (state is EditJournalFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text(state.errorMessage));
        }
      },
      child: child,
    );
  }
}