import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/edit_medical_record_cubit/edit_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_content.dart';

class EditMedicalRecordBlocListener extends StatelessWidget {
  const EditMedicalRecordBlocListener({super.key, required this.isEdit, this.recordId});

  final bool isEdit;
  final String? recordId;

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditMedicalRecordCubit, EditMedicalRecordState>(
      listener: (context, state) async {
        if (state is EditMedicalRecordLoading) {
          showLoadingDialog(context, message: 'Editing medical record...');
        } else if (state is EditMedicalRecordSuccess) {
          if (context.mounted) {
            GoRouter.of(context).pop();
            GoRouter.of(context).pushReplacement(AppRoutes.medicalRecords);
            context.showSnackBar(
              const Text('Medical record edited successfully'),
            );
          }
        } else if (state is EditMedicalRecordFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(
            const Text('Failed to edit medical record'),
          );
        }
      },
      child: EditRecordContent(isEdit: isEdit,recordId: recordId,),
    );
  }
}
