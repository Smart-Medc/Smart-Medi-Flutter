import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/widgets/app_bar_back_button.dart';
import 'package:smart_medi/core/widgets/app_header.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/add_journal_entry_widgets/add_journal_entry_form_fields.dart';

class AddJournalEntryViewBody extends StatelessWidget {
  const AddJournalEntryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarBackButton(),
          const AppHeader(
            title: 'New Journal Entry',
            subtitle: 'Record your daily observations',
          ),
          24.verticalSpace,
          const AddJournalEntryFormFields(),
          35.verticalSpace,
        ],
      ),
    );
  }
}

