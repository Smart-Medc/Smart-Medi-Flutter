import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/widgets/app_drawer.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/delete_journal_cubit/delete_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/get_medical_journals/get_medical_journals_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_view_body.dart';

class MedicalJournalView extends StatelessWidget {
  const MedicalJournalView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  GetMedicalJournalsCubit(getIt<MedicalJournalRepo>())
                    ..getMedicalJournalsForCurrentPatient(),
            ),
            BlocProvider(
              create: (context) =>
                  DeleteJournalCubit(getIt<MedicalJournalRepo>()),
            ),
          ],
          child: const MedicalJournalViewBody(),
        ),
        drawer: const AppDrawer(selectedItem: DrawerItem.journal),
      ),
    );
  }
}



