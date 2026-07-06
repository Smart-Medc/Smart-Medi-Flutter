import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/add_medical_record_cubit/add_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/edit_medical_record_cubit/edit_medical_record_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/edit_record_widgets/edit_record_body.dart';

class EditRecordView extends StatelessWidget {
  const EditRecordView({super.key, required this.isEdit, this.recordId});

  final bool isEdit;
  final String? recordId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: isEdit
            ? BlocProvider(
                create: (context) =>
                    EditMedicalRecordCubit(getIt<MedicalRecordsRepo>()),
                child: EditRecordBody(isEdit: isEdit, recordId: recordId),
              )
            : BlocProvider(
                create: (context) =>
                    AddMedicalRecordCubit(getIt<MedicalRecordsRepo>()),
                child: EditRecordBody(isEdit: isEdit),
              ),
      ),
    );
  }
}
