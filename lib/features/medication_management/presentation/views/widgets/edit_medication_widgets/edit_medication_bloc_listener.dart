import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/edit_medication_cubit/edit_medication_cubit.dart';

class EditMedicationBlocListener extends StatelessWidget {
  const EditMedicationBlocListener({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditMedicationCubit, EditMedicationState>(
      listener: (context, state) {
        if (state is EditMedicationLoading) {
          showLoadingDialog(context, message: 'Saving medication changes...');
        } else if (state is EditMedicationSuccess) {
          GoRouter.of(context).pop();
          context.showSnackBar(const Text('Medication updated successfully'));
          GoRouter.of(context).pop(true);
        } else if (state is EditMedicationFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text('Failed to update medication: ${state.message}'));
        }
      },
      child: child,
    );
  }
}

