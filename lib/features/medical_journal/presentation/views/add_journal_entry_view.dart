import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_medi/core/helpers/service_locator.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/features/medical_journal/data/repos/medical_journal_repo.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/add_journal_cubit/add_journal_cubit.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_entry_view_body.dart';

class AddJournalEntryView extends StatelessWidget {
  const AddJournalEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteBackgroundColor,
        body: BlocProvider(
          create: (context) => AddJournalCubit(getIt<MedicalJournalRepo>()),
          child: const AddJournalEntryViewBody(),
        ),
      ),
    );
  }
}

