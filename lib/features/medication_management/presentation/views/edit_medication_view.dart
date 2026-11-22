import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/edit_medication_cubit/edit_medication_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/edit_medication_widgets/edit_medication_view_body.dart';

class EditMedicationView extends StatelessWidget {
  const EditMedicationView({
    super.key,
    required this.medicationId,
    required this.medicationName,
    required this.dosage,
    required this.frequency,
    required this.dosageRoute,
    required this.startDate,
    required this.prescribingDoctor,
  });

  final String medicationId;
  final String medicationName;
  final String dosage;
  final String frequency;
  final String dosageRoute;
  final String startDate;
  final String prescribingDoctor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => EditMedicationCubit(getIt<MedicationManagementRepo>()),
          child: EditMedicationViewBody(
            medicationId: medicationId,
            medicationName: medicationName,
            dosage: dosage,
            frequency: frequency,
            dosageRoute: dosageRoute,
            startDate: startDate,
            prescribingDoctor: prescribingDoctor,
          ),
        ),
      ),
    );
  }
}

