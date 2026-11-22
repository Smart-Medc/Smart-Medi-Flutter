import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/helpers/extensions.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/custom_loading_indicator.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/add_medical_record_cubit/add_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_content.dart';
class AddMedicalRecordBlocListener extends StatelessWidget {
  const AddMedicalRecordBlocListener({super.key, required this.isEdit});
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMedicalRecordCubit, AddMedicalRecordState>(
      listener: (context, state) async {
        if (state is AddMedicalRecordLoading) {
          showLoadingDialog(context, message: 'Adding medical record...');
        } else if (state is AddMedicalRecordSuccess) {
          if (context.mounted) {
            GoRouter.of(context).pop();
            GoRouter.of(context).pushReplacement(AppRoutes.medicalRecords);
            context.showSnackBar(const Text('Medical record added successfully'));
          }
        } else if (state is AddMedicalRecordFailure) {
          GoRouter.of(context).pop();
          context.showSnackBar(Text('Failed to add medical record: ${state.message}'));
        }
      },
      child:  EditRecordContent(isEdit: isEdit),
    );
  }
}
