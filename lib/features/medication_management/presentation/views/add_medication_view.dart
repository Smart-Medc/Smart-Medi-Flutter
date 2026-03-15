import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/add_medication_cubit/add_medication_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/add_medication_widgets/add_medication_view_body.dart';

class AddMedicationView extends StatelessWidget {
  const AddMedicationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => AddMedicationCubit(getIt<MedicationManagementRepo>()),
          child: const AddMedicationViewBody(),
        ),
      ),
    );
  }
}
