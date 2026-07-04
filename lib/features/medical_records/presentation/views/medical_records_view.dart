import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/medical_records/data/repos/medical_records_repo.dart';
import 'package:smart_medi/features/medical_records/presentation/manager/get_medical_records_cubit/get_medical_records_cubit.dart';
import 'package:smart_medi/features/medical_records/presentation/views/widgets/medical_records_view_widgets/medical_records_body.dart';

class MedicalRecordsView extends StatelessWidget {
  const MedicalRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) =>
              GetMedicalRecordsCubit(getIt<MedicalRecordsRepo>())..getMedicalRecords(),
          child: const MedicalRecordsBody(),
        ),
        drawer: const AppDrawer(selectedItem: DrawerItem.medicalRecords),
      ),
    );
  }
}
