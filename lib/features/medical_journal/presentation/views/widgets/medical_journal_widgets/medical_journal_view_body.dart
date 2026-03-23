import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_search_bar.dart';
import 'package:smart_medi/core/widgets/custom_app_bar.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_entries_bloc_builder.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/medical_journal_widgets/medical_journal_header.dart';

class MedicalJournalViewBody extends StatelessWidget {
  const MedicalJournalViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            const MedicalJournalHeader(),
            const AppSearchBar(hintText: 'Search journal entries', showFilter: false),
            const MedicalJournalEntriesBlocBuilder(),

            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}

