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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          sliver:  SliverMainAxisGroup(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(),
                    MedicalJournalHeader(),
                    AppSearchBar(
                      hintText: 'Search journal entries',
                      showFilter: false,
                    ),
                  ],
                ),
              ),
              const MedicalJournalEntriesBlocBuilder(),
              SliverToBoxAdapter(child: 20.verticalSpace),
            ],
          ),
        ),
      ],
    );
  }
}

