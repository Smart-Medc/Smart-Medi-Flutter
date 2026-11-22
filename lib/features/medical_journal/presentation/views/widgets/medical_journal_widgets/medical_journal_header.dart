import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_medi/core/routing/app_routes.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_journal/presentation/manager/get_medical_journals/get_medical_journals_cubit.dart';

class MedicalJournalHeader extends StatelessWidget {
  const MedicalJournalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppHeader(
      title: 'Medical Journal',
      subtitle: 'Track your symptoms and daily observations',
      actionText: 'Add Entry',
      onActionPressed: () async {
        final added = await GoRouter.of(context)
            .push<bool>(AppRoutes.addJournalEntry);
        if (added == true && context.mounted) {
          context
              .read<GetMedicalJournalsCubit>()
              .getMedicalJournalsForCurrentPatient();
        }
      },
    );
  }
}
