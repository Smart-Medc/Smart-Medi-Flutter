import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/medication_management/data/repos/medication_management_repo.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/delete_medication_cubit/delete_medication_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/manager/get_medications_cubit/get_medications_cubit.dart';
import 'package:smart_medi/features/medication_management/presentation/views/widgets/medication_management_widgets/medication_management_view_body.dart';

class MedicationManagementView extends StatelessWidget {
  const MedicationManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  GetMedicationsCubit(getIt<MedicationManagementRepo>())
                    ..loadMedicationsForCurrentPatient(),
            ),
            BlocProvider(
              create: (context) =>
                  DeleteMedicationCubit(getIt<MedicationManagementRepo>()),
            ),
          ],
          child: const MedicationManagementViewBody(),
        ),
        drawer: const AppDrawer(selectedItem: DrawerItem.medications),
      ),
    );
  }
}

