import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/data_sharing/presentation/views/widgets/share_records_view_widgets/share_records_view_body.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_cubit/get_medical_records_cubit.dart';

class ShareRecordsView extends StatelessWidget {
  const ShareRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
              GetMedicalRecordsCubit(getIt<MedicalRecordsRepo>())
                ..getMedicalRecords(),
            ),
            BlocProvider(
              create: (context) =>
              GetMedicalRecordsCubit(getIt<MedicalRecordsRepo>())
                ..getMedicalRecords(),
            ),
          ],
          child: const ShareRecordsViewBody(),
        ),
      ),
    );
  }
}
