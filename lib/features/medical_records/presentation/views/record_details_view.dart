import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_record_details_cubit/get_medical_record_details_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/record_details_widgets/record_details_body.dart';

class RecordDetailsView extends StatelessWidget {
  const RecordDetailsView({super.key, required this.patientId, required this.recordId});
  final String patientId;
  final String recordId;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => GetMedicalRecordDetailsCubit(getIt<MedicalRecordsRepo>())..getMedicalRecordDetails(patientId: patientId, recordId: recordId),
          child: const RecordDetailsBody(),
        ),
      ),
    );
  }
}
