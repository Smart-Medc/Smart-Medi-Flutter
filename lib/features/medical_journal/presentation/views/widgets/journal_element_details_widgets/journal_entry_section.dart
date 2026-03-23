import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/core/widgets/card_container.dart';
import 'package:smart_medi/features/medical_journal/data/models/get_journals_models/get_journal_response.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/journal_chip_section.dart';

class JournalEntrySection extends StatelessWidget {
  const JournalEntrySection({super.key, required this.journalEntry});

  final JournalListItem journalEntry;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardContainer(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Entry title
            Text('Entry', style: AppStyles.textStyle15W600Black),
            16.verticalSpace,

            // Scrollable entry text
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 8.w),
                  child: Text(
                    journalEntry.excerpt.trim().isEmpty
                        ? 'No content'
                        : journalEntry.excerpt,
                    style: AppStyles.textStyle12W400DarkGrey,
                  ),
                ),
              ),
            ),

            8.verticalSpace,

            // Symptoms section - fixed at bottom
            JournalChipSection(
              title: 'Symptoms',
              items: journalEntry.symptoms,
            ),

            // Tags section - fixed at bottom
            JournalChipSection(
              title: 'Tags',
              items: journalEntry.tags,
            ),
          ],
        ),
      ),
    );
  }
}
