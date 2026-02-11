import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_medi/core/utils/app_colors.dart';
import 'package:smart_medi/core/utils/app_styles.dart';
import 'package:smart_medi/features/medical_journal/presentation/views/widgets/journal_element_details_widgets/journal_chip.dart';

/// A section widget that displays a title and a list of chips.
/// Used for displaying symptoms and tags in the journal details.
class JournalChipSection extends StatelessWidget {
  const JournalChipSection({
    super.key,
    required this.title,
    required this.items,
    this.chipColor = AppColors.iconCyan,
  });

  final String title;
  final List<String> items;
  final Color chipColor;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle15W600Black,
        ),
        12.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: items.map((item) => JournalChip(label: item, color: chipColor)).toList(),
        ),
        24.verticalSpace,
      ],
    );
  }
}

